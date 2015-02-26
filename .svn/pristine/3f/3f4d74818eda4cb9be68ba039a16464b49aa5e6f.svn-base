package com.cinema.servlets;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.EmailValidator;

import com.cinema.Role;
import com.cinema.persistence.EntityManagerProviderImpl;
import com.cinema.persistence.dao.UserDAO;
import com.cinema.persistence.model.User;
import com.cinema.persistence.model.UserRole;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String USERNAME_PATTERN = "^[a-z0-9_-]{5,15}$";
	private static final String PASSWORD_PATTERN = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";

	private final Pattern usernamePattern;
	private final Pattern passwordPattern;
	private Matcher matcher;

	public RegisterServlet() {
		usernamePattern = Pattern.compile(USERNAME_PATTERN);
		passwordPattern = Pattern.compile(PASSWORD_PATTERN);
	}

	@Override
	public void doGet(HttpServletRequest aRequest, HttpServletResponse aResponse) throws IOException, ServletException {
		String username = getParameterInUTF8(aRequest, "user");
		String password = getParameterInUTF8(aRequest, "pass");
		String confirmPassword = getParameterInUTF8(aRequest, "confirmPass");
		String firstName = getParameterInUTF8(aRequest, "firstName");
		String lastName = getParameterInUTF8(aRequest, "lastName");
		String email = getParameterInUTF8(aRequest, "email");
		String errorUser = "";
		String errorPass = "";
		String errorConfirmPass = "";
		String errorFirstName = "";
		String errorLastName = "";
		String errorEmail = "";

		boolean isAllFieldsCorrect = true;
		boolean isUsernameAccepted = true;

		UserDAO userDAO = new UserDAO(EntityManagerProviderImpl.getInstance());
		List<User> allRegisterdUsers = userDAO.getAll();

		for (User user : allRegisterdUsers) {
			if (user.getUsername().equals(username)) {
				errorUser = "Потребителското име е заето.";
				isUsernameAccepted = false;
				break;
			}
		}
		if (isUsernameAccepted) {

			if (!validateUsername(username)) {
				errorUser = "Това поле трябва да съдъжа от 5 до 15 символа: а-z, 0-9, '_' и '-'";
				isAllFieldsCorrect = false;
			}

			if (!validatePassword(password)) {
				errorPass = "Това поле трябва да съдържа поне едно число, една малка буква, една главна буква и един специален символ от изброените: @#$%. Позволена дължина от 6 до 20 символа.";
				isAllFieldsCorrect = false;
			}

			if (!(confirmPassword.equals(password))) {
				errorConfirmPass = "Потвърждението на паролата не съвпада.";
				isAllFieldsCorrect = false;
			}

			if (firstName.length() < 2) {
				errorFirstName = "Това поле не може да съдържа по-малко от 2 символа.";
				isAllFieldsCorrect = false;
			}

			if (lastName.length() < 2) {
				errorLastName = "Това поле не може да съдържа по-малко от 2 символа.";
				isAllFieldsCorrect = false;
			}

			if (!EmailValidator.getInstance().isValid(email)) {
				errorEmail = "Невалиден имейл.";
				isAllFieldsCorrect = false;
			}

			if (isAllFieldsCorrect) {
				saveNewUser(username, password, firstName, lastName, email, userDAO);
				aRequest.getRequestDispatcher("SuccessfulRegistration.jsp").forward(aRequest, aResponse);
				return;
			}
		}
		aRequest.setAttribute("errorUser", errorUser);
		aRequest.setAttribute("errorPass", errorPass);
		aRequest.setAttribute("errorConfirmPass", errorConfirmPass);
		aRequest.setAttribute("errorFirstName", errorFirstName);
		aRequest.setAttribute("errorLastName", errorLastName);
		aRequest.setAttribute("errorEmail", errorEmail);
		aRequest.getRequestDispatcher("Register.jsp").forward(aRequest, aResponse);
	}

	private String getParameterInUTF8(HttpServletRequest request, String parameterName) throws UnsupportedEncodingException {
		String value = request.getParameter(parameterName);
		return value == null ? value : new String(value.getBytes("iso-8859-1"), "UTF-8");
	}

	private boolean validateUsername(final String username) {
		matcher = usernamePattern.matcher(username);
		return matcher.matches();
	}

	private boolean validatePassword(final String username) {
		matcher = passwordPattern.matcher(username);
		return matcher.matches();
	}

	private void saveNewUser(String username, String password, String firstName, String lastName, String email, UserDAO userDAO) {
		User user = new User(username, password, firstName, lastName, email);
		UserRole role = new UserRole();
		role.setRoleName(Role.CLIENT.getRoleName());
		user.addUserRole(role);
		userDAO.saveNew(user);
	}

	@Override
	public void doPost(HttpServletRequest aRequest, HttpServletResponse aResponse) throws IOException, ServletException {
		doGet(aRequest, aResponse);
	}
}
