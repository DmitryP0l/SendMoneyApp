###  Как это работает

1. WelcomeScreenViewController: Пользователь нажимает на кнопку startButton, вызывается метод startButtonTapped, который вызывает метод интерактора startButtonTapped.

2. WelcomeScreenInteractor: Обрабатывает запрос и вызывает метод презентера presentRegistrationScreen.

3. WelcomeScreenPresenter: Подготавливает данные и вызывает метод ViewController displayRegistrationScreen.

4. WelcomeScreenViewController: Использует роутер для навигации на экран RegistrationScreen.

Подробнее

	 - Пользователь нажимает на startButton.
	 - WelcomeScreenViewController вызывает interactor?.startButtonTapped().
	 - WelcomeScreenInteractor вызывает presenter?.presentRegistrationScreen().
	 - WelcomeScreenPresenter вызывает viewController?.displayRegistrationScreen().
	 - WelcomeScreenViewController вызывает router.routeToRegistrationScreen().
	 - WelcomeScreenRouter выполняет переход на RegistrationViewController.
	

5. RegistrationViewController: Пользователь вводит данные и нажимает на кнопку enterButton, вызывается метод enterButtonTapped, который вызывает метод интерактора enterButtonTapped с данными.

6. RegistrationInteractor: Проверяет данные и вызывает метод презентера presentHomePage или presentAlert в зависимости от результата.

7. RegistrationPresenter: Подготавливает данные и вызывает метод ViewController displayHomePage или displayAlert.

8. RegistrationViewController: Использует роутер для навигации на экран HomePageScreen или отображает сообщение об ошибке.

