package com.grupo4.LaburApp.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.grupo4.LaburApp.models.User;
import com.grupo4.LaburApp.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepo;
	
	public List<User> allUsers(){
		return userRepo.findAll();
	}
	
	public User findAdmin(User admin) {
		return userRepo.findByEsAdmin(admin.getEsAdmin());
	}
	
	public User saveUser(User user) {
		return userRepo.save(user);
	}
	
	public User saveOrUpdate(User user, BindingResult result) {
	    // Verificar si es una actualización o un nuevo registro
	    boolean isUpdating = user.getId() != null;

	    if (!isUpdating) {
	        // Comparar las contraseñas solo si es un nuevo registro
	        String password = user.getPassword();
	        String confirm = user.getConfirm();
	        if (confirm == null || !password.equals(confirm)) {
	            result.rejectValue("confirm", "Matches", "Password and confirmation don't match");
	        }

	        // Revisar que el email no esté registrado solo si es un nuevo registro
	        String email = user.getEmail();
	        User userExist = userRepo.findByEmail(email); // Objeto de User o null
	        if (userExist != null) {
	            result.rejectValue("email", "Unique", "E-mail already exists");
	        }
	    } else {
	        // Para actualización, si el email ha cambiado, verificar que no esté registrado
	        User existingUser = userRepo.findById(user.getId()).orElse(null);
	        if (existingUser != null && !existingUser.getEmail().equals(user.getEmail())) {
	            User userExist = userRepo.findByEmail(user.getEmail());
	            if (userExist != null) {
	                result.rejectValue("email", "Unique", "E-mail already exists");
	            }
	        }

	        // Si no estamos actualizando la contraseña, conservamos la contraseña existente
	        if (existingUser != null) {
	            if (user.getPassword() == null || user.getPassword().isEmpty()) {
	                user.setPassword(existingUser.getPassword());
	            } else {
	                // Comparar las contraseñas si se proporciona una nueva contraseña
	                String password = user.getPassword();
	                String confirm = user.getConfirm();
	                if (confirm == null || !password.equals(confirm)) {
	                    result.rejectValue("confirm", "Matches", "Password and confirmation don't match");
	                } else {
	                    // Hashear nueva contraseña
	                    String passHash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
	                    user.setPassword(passHash); // Establecemos el password hasheado
	                }
	            }
	        }
	    }

	    // Si existe error, regreso null
	    if (result.hasErrors()) {
	        return null;
	    } else {
	        // NO HAY ERRORES
	        // Si no es actualización, hashear contraseña
	        if (!isUpdating) {
	            String passHash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
	            user.setPassword(passHash); // Establecemos el password hasheado
	        }
	        return userRepo.save(user);
	        }
	    }


	
	
	// Metodo que devuelve una lista de usuarios de acuerdo a su nombre (si hay coincidencias)
	public List<User> usersContaining(String username){
		return userRepo.findByKeywordContaining(username);
	}

	
	/*Método que registre a un nuevo usuario*/
	public User register(User newUser, BindingResult result) {
		
		//Comparar las contraseñas
		String password = newUser.getPassword();
		String confirm = newUser.getConfirm();
		if(!password.equals(confirm)) {
			//SI no son iguales
			//path, clave, mensaje
			result.rejectValue("confirm", "Matches", "Password and confirmation don't match");
		}
		
		//Revisar que el email no esté registrado
		String email = newUser.getEmail();
		User userExist = userRepo.findByEmail(email); //Objeto de User o null
		if(userExist != null) {
			//El correo ya está registrado
			result.rejectValue("email", "Unique", "E-mail already exists");
		}
		
		//Si existe error, regreso null
		if(result.hasErrors()) {
			return null;
		} else {
			//NO HAY ERRORES
			//Hashear contraseña
			String passHash = BCrypt.hashpw(password, BCrypt.gensalt());
			newUser.setPassword(passHash); //Establecemos el password hasheado
			return userRepo.save(newUser);
		}
		
	}
	
	/*Método que revisa que los datos sean correctos para Iniciar Sesión*/
	public User login(String email, String password) {
		//Revisamos que el correo exista en BD
		User userTryingLogin = userRepo.findByEmail(email); //Objeto User o NULL
		
		if(userTryingLogin == null) {
			return null;
		}
		
		//Comparar las contraseñas
		//BCrypt.checkpw(Contra NO encriptada, Contra SI encriptada) -> True o False
		if(BCrypt.checkpw(password, userTryingLogin.getPassword())) {
			return userTryingLogin;
		} else {
			return null;
		}
		
		
	}
	
	// Borra un usuario
	public void deleteUser(Long id) {
		userRepo.deleteById(id);
	}
	
	// Editar un Usuario (Ver el tema de comparar contraseñas antes 
	// de cambiar. REVISAR
	public User editUser(User user) {
		return userRepo.save(user);
	}
	// Devuelve un usuario
	public User user(Long id) {
		return userRepo.findById(id).orElse(null);
	}
}
