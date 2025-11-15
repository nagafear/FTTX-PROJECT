# FTTX-PROJECT

Professional web application for FTTx market tracking and management developed for the North Urban Center of Tunis - Tunisia Telecom.

## 📋 Description

FTTX-PROJECT is a comprehensive web platform dedicated to tracking, managing, and monitoring operations related to the FTTx (Fiber to the X) market. The application provides an intuitive interface for real-time project tracking, administrative management, operation logging, and commission tracking.

## ✨ Key Features

### 🎯 Interactive Dashboard
- Real-time overview of FTTx projects
- Statistics and performance indicators
- Customized dashboards by user role

### 📊 Administrative Management
- **Customer Management**: Complete administration of clients and their information
- **SDR Management**: Tracking and administration of SDR (Sales & Distribution) operations
- **SPI Management**: Administration of SPI (Service Provider Interface) operations
- **Commission Reception**: Tracking and management of reception commissions

### 📝 Operations Journal
- Complete logging of all operations performed
- Detailed history with timestamps
- Logging system for complete traceability
- Secure log deletion (with authentication)

### 🔐 Authentication System
- Secure login with different access levels
- Authentication for administrative journal
- User session management
- Secure logout

### 📄 Document Management
- PDF document viewing
- File upload and management
- Document organization by project

## 🏗️ Technical Architecture

### Technology Stack
- **Backend**: PHP 7.4+ with MVC architecture
- **Database**: MySQL/MariaDB with PostgreSQL support
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **CSS Framework**: Bootstrap 4.5.2
- **Icons**: Font Awesome 5.15.4
- **DB Connection**: PDO (PHP Data Objects) for security and performance

### Project Structure

```
fttx_project/
├── index.php                    # Main homepage
├── dashboard.php                # Interactive dashboard
├── database.php                 # Database configuration
├── login.php                    # Main login page
├── login_journal.php            # Journal admin login
├── logout.php                   # Secure logout
│
├── admin_clientele.php          # Customer administration
├── admin_sdr.php                # SDR administration
├── admin_spi.php                # SPI administration
├── admin_commission_reception.php # Commission management
│
├── journal.php                  # Operations journal
├── initialize_journal_admin.php # Journal admin initialization
├── delete_log.php               # Secure log deletion
│
├── view_pdf.php                 # PDF document viewing
├── serve_file.php               # File service
├── setup_users.php              # User configuration
├── supprimer_operation.php      # Operation deletion
│
├── css/
│   └── style.css                # Custom styles
├── js/                          # JavaScript scripts
├── includes/                    # Included files (headers, footers, etc.)
└── uploads/                     # Uploaded files (images, documents)
```

## 🚀 Installation

### Prerequisites
- PHP 7.4 or higher
- MySQL 5.7+ / MariaDB 10.3+ or PostgreSQL 12+
- Apache with mod_rewrite enabled (optional)
- PHP Extensions: PDO, PDO_MySQL (or PDO_PGSQL for PostgreSQL), GD, ZIP

### Local Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Nedim7050/FTTX-PROJECT.git
   cd FTTX-PROJECT
   ```

2. **Configure the database**
   - Create a MySQL/PostgreSQL database
   - Import the database schema if available
   - Configure connection information in `database.php` or via environment variables

3. **Configure environment variables**
   - Create a `.env` file at the root (based on `.env.example` if available)
   - Configure the following variables:
     ```
     DB_HOST=127.0.0.1
     DB_PORT=3306
     DB_NAME=fttx_project
     DB_USER=root
     DB_PASSWORD=your_password
     APP_ENV=development
     ```

4. **Configure permissions**
   - Ensure the `uploads/` folder is writable
   ```bash
   chmod -R 755 uploads/
   ```

5. **Initialize users**
   - Run `setup_users.php` to configure initial user accounts

## ⚙️ Configuration

### Database

The application automatically supports MySQL and PostgreSQL. Detection is done automatically based on the configured port:
- Port `3306` → MySQL
- Port `5432` → PostgreSQL

### Environment Variables

The application uses environment variables for configuration, allowing flexibility between development and production:

| Variable | Description | Default |
|----------|-------------|---------|
| `DB_HOST` | Database server address | `127.0.0.1` |
| `DB_PORT` | Database port | `3306` (MySQL) or `5432` (PostgreSQL) |
| `DB_NAME` | Database name | `fttx_project` |
| `DB_USER` | Database user | `root` |
| `DB_PASSWORD` | Database password | (empty) |
| `APP_ENV` | Environment (development/production) | `development` |

## 🔒 Security

- **Secure connections**: Use of PDO with prepared statements to prevent SQL injection
- **Authentication**: Login system with secure session management
- **Sensitive file protection**: Exclusion of `.env` files via `.gitignore`
- **Input validation**: Validation and sanitization of user data
- **Error handling**: Error messages adapted according to environment (development vs production)

## 📱 User Interface

The application offers a modern and responsive interface:
- Responsive design adapting to all screens (desktop, tablet, mobile)
- Intuitive navigation with clear navigation menu
- CSS animations for better user experience
- Interface consistent with Tunisia Telecom brand guidelines

## 🛠️ Development

### MVC Structure
The application follows an MVC (Model-View-Controller) architecture:
- **Model**: `database.php` - Data management
- **View**: PHP files with mixed HTML/PHP
- **Controller**: Business logic in each PHP file

### Contributing
To contribute to the project:
1. Fork the repository
2. Create a branch for your feature (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -m 'Add my feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Open a Pull Request

## 📞 Support and Contact

For any questions, suggestions, or issues:
- Create an issue on [GitHub](https://github.com/Nedim7050/FTTX-PROJECT/issues)
- Contact the North Urban Center development team

## 👨‍💻 Author

**Nedim Mejri**

Developer of the FTTX-PROJECT application for the North Urban Center of Tunis - Tunisia Telecom.

## 📄 License

This project is the exclusive property of **Tunisia Telecom** and is intended for internal use.

---

**Developed with ❤️ by Nedim Mejri for the North Urban Center of Tunis - Tunisia Telecom**

© 2024 Tunisia Telecom. All rights reserved.
