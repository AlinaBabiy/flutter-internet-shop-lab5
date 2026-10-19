Інтернет-магазин на Flutter
Навчальний Flutter-застосунок для перегляду каталогу товарів.
Архітектура застосунку
flowchart TD
    P["Presentation: Flutter UI та AppDependencies"]
    A["Application: ProductProvider"]
    D["Domain: Product та ProductRepository"]
    R["Data: ProductRepositoryImpl"]
    I["Infrastructure: ProductService"]

    P --> A
    A --> D
    P --> R
    R --> D
    R --> I
Призначення шарів
Domain — сутність Product та інтерфейс ProductRepository.
Application — ProductProvider, керування станом каталогу.
Data — ProductRepositoryImpl, реалізація репозиторію.
Infrastructure — ProductService, джерело даних.
Presentation — Flutter UI та Dependency Injection через AppDependencies.
Встановлення та запуск
Встановити Flutter SDK.
Відкрити проєкт у VS Code.
Виконати команди:
flutter pub get
flutter run -d chrome
Перевірка коду
flutter analyze
Робота з Git
Розробка виконувалася у feature-гілках із Pull Requests у develop та подальшим злиттям у main. Створено тег v1.0.0.