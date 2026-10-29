@echo off
chcp 65001 >nul
title HaHa Eco Travel - Đẩy Mã Nguồn Lên GitHub

:: Cấu hình biến môi trường PATH để Git Credential Manager hoạt động bình thường
set "PATH=%LOCALAPPDATA%\Programs\Git\cmd;%LOCALAPPDATA%\Programs\Git\ucrt64\bin;%LOCALAPPDATA%\Programs\Git\bin;C:\Program Files\Git\cmd;C:\Program Files\Git\bin;%PATH%"

echo ===================================================================
echo     🌍 HAHA ECO TRAVEL - ĐẨY DỰ ÁN LÊN GITHUB REPOSITORY
echo     Tài khoản: daquangha0201
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
        echo [!] Không tìm thấy Git.
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

:: 3. Cấu hình danh tính và Credential Manager
"%GIT_CMD%" config user.name "daquangha0201"
"%GIT_CMD%" config user.email "daquangha0201@users.noreply.github.com"
"%GIT_CMD%" config credential.helper manager

:: 4. Thêm file và commit bản mới nhất
echo [*] Kiểm tra và đóng gói các tệp mã nguồn sạch...
"%GIT_CMD%" add .
"%GIT_CMD%" commit -m "feat: HaHa Eco Travel ERP v1.0 - Full UI, Real-time Cloud Sync & Giám Đốc 1-touch" >nul 2>&1

:: 5. Cấu hình Remote Origin
echo [*] Cấu hình liên kết tới https://github.com/daquangha0201/HAHA-ECO-TRAVEL.git
"%GIT_CMD%" remote remove origin >nul 2>&1
"%GIT_CMD%" remote add origin https://github.com/daquangha0201/HAHA-ECO-TRAVEL.git

echo.
echo ===================================================================
echo [*] ĐANG TIẾN HÀNH ĐẨY MÃ NGUỒN (PUSH) LÊN GITHUB...
echo ===================================================================
echo.

"%GIT_CMD%" push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ===================================================================
    echo [OK] THÀNH CÔNG RỰC RỠ! MÃ NGUỒN ĐÃ ĐƯỢC ĐẨY LÊN GITHUB!
    echo Vercel sẽ tự động build lại trang web trong 15 giây.
    echo Xem kho tại: https://github.com/daquangha0201/HAHA-ECO-TRAVEL
    echo ===================================================================
) else (
    echo.
    echo ===================================================================
    echo [!] KHO 'HAHA-ECO-TRAVEL' CHƯA ĐƯỢC TẠO TRÊN TÀI KHOẢN GITHUB CỦA BẠN!
    echo.
    echo Hệ thống sẽ tự động mở trang tạo kho trên trình duyệt cho bạn...
    echo (Chỉ cần bấm nút xanh 'Create repository' là xong!)
    echo ===================================================================
    start https://github.com/new?name=HAHA-ECO-TRAVEL
)

echo.
pause
