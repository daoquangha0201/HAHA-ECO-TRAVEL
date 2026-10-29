@echo off
chcp 65001 >nul
title HaHa Eco Travel - Đẩy Mã Nguồn Lên GitHub

echo ===================================================================
echo     🌍 HAHA ECO TRAVEL - ĐẨY DỰ ÁN LÊN GITHUB REPOSITORY
echo     Repo: https://github.com/daquangha0201/HAHA-ECO-TRAVEL
echo ===================================================================
echo.

cd /d "%~dp0"

:: 1. Xác định đường dẫn Git
set "GIT_CMD=git"
where git >nul 2>&1
if %errorlevel% neq 0 (
    if exist "%LOCALAPPDATA%\Programs\Git\cmd\git.exe" (
        set "GIT_CMD=%LOCALAPPDATA%\Programs\Git\cmd\git.exe"
    ) else if exist "C:\Program Files\Git\cmd\git.exe" (
        set "GIT_CMD=C:\Program Files\Git\cmd\git.exe"
    ) else (
        echo [!] Không tìm thấy Git. Vui lòng tải Git tại: https://git-scm.com/download/win
        pause
        exit /b 1
    )
)

echo [+] Sử dụng Git: "%GIT_CMD%"
"%GIT_CMD%" --version
echo.

:: 2. Khởi tạo Git & Nhánh main
if not exist ".git" (
    echo [*] Khởi tạo kho lưu trữ Git cục bộ...
    "%GIT_CMD%" init
)
"%GIT_CMD%" branch -M main

:: 3. Cấu hình danh tính tác giả
"%GIT_CMD%" config user.name "daquangha0201"
"%GIT_CMD%" config user.email "daquangha0201@users.noreply.github.com"

:: 4. Thêm file và commit
echo [*] Kiểm tra và đóng gói các tệp mã nguồn sạch...
"%GIT_CMD%" add .
"%GIT_CMD%" commit -m "feat: HaHa Eco Travel ERP/CRM v1.0 Enterprise Release" >nul 2>&1

:: 5. Cấu hình Remote Origin
echo [*] Cấu hình liên kết tới https://github.com/daquangha0201/HAHA-ECO-TRAVEL.git
"%GIT_CMD%" remote remove origin >nul 2>&1
"%GIT_CMD%" remote add origin https://github.com/daquangha0201/HAHA-ECO-TRAVEL.git

echo.
echo ===================================================================
echo [*] ĐANG TIẾN HÀNH ĐẨY MÃ NGUỒN (PUSH) LÊN GITHUB...
echo ===================================================================
echo.
echo Lưu ý: Nếu trình duyệt hoặc cửa sổ GitHub hiện lên hỏi đăng nhập,
echo bạn chỉ cần chọn "Sign in with your browser" và bấm xác nhận Authorize.
echo.

"%GIT_CMD%" push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ===================================================================
    echo [OK] THÀNH CÔNG RỰC RỠ! MÃ NGUỒN ĐÃ ĐƯỢC ĐẨY LÊN GITHUB!
    echo Truy cập xem ngay: https://github.com/daquangha0201/HAHA-ECO-TRAVEL
    echo ===================================================================
) else (
    echo.
    echo ===================================================================
    echo [!] NẾU GẶP LỖI XÁC THỰC HOẶC REPOSITORY ĐÃ CÓ FILE TRƯỚC ĐÓ:
    echo.
    echo 1. Nếu kho trên GitHub đã có sẵn README hoặc LICENSE, chạy lệnh gộp:
    echo    "%GIT_CMD%" pull origin main --allow-unrelated-histories
    echo    "%GIT_CMD%" push -u origin main
    echo.
    echo 2. HOẶC CÁCH ĐƠN GIẢN NHẤT TRÊN WEB (30 GIÂY):
    echo    - Vào: https://github.com/daquangha0201/HAHA-ECO-TRAVEL
    echo    - Bấm "Add file" -> "Upload files"
    echo    - Kéo toàn bộ file trong thư mục này thả vào và bấm "Commit changes"!
    echo ===================================================================
)

echo.
pause
