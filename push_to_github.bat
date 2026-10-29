@echo off
chcp 65001 >nul
title HaHa Eco Travel - Đẩy Mã Nguồn Lên GitHub

echo ===================================================================
echo     🌍 HAHA ECO TRAVEL - TỰ ĐỘNG ĐẨY DỰ ÁN LÊN GITHUB
echo ===================================================================
echo.

cd /d "%~dp0"

:: 1. Kiểm tra Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] HỆ THỐNG CHƯA CÀI ĐẶT GIT CLI.
    echo.
    echo Bạn có 3 cách rất dễ dàng để đưa mã nguồn lên GitHub:
    echo.
    echo  [CÁCH 1 - KHUYÊN DÙNG KHÔNG CẦN CÀI ĐẶT]:
    echo   1. Mở trình duyệt vào: https://github.com/new
    echo   2. Đặt tên repository: haha-operating-system (chọn Public hoặc Private)
    echo   3. Bấm 'Create repository'
    echo   4. Bấm vào liên kết 'uploading an existing file'
    echo   5. Kéo toàn bộ các file trong thư mục này thả vào trình duyệt và bấm 'Commit changes'!
    echo.
    echo  [CÁCH 2 - DÙNG GITHUB DESKTOP (Giao diện đồ họa)]:
    echo   1. Tải và cài đặt từ: https://desktop.github.com/
    echo   2. Mở GitHub Desktop -> Chọn 'Add Existing Repository' -> Chọn thư mục này -> Bấm 'Publish repository'.
    echo.
    echo  [CÁCH 3 - CÀI ĐẶT GIT ĐỂ CHẠY FILE NÀY]:
    echo   Bạn có muốn mở trang tải Git for Windows ngay bây giờ không? (Y/N)
    set /p open_git="Nhập lựa chọn: "
    if /i "%open_git%"=="Y" (
        start https://git-scm.com/download/win
    )
    echo.
    pause
    exit /b
)

echo [+] Đã tìm thấy Git trên máy tính của bạn!
echo.

:: 2. Khởi tạo Git nếu chưa có
if not exist ".git" (
    echo [*] Đang khởi tạo kho lưu trữ Git cục bộ...
    git init
) else (
    echo [*] Đã có cấu hình Git cục bộ.
)

:: 3. Chuyển nhánh chính thành main
git branch -M main

:: 4. Thêm file theo .gitignore
echo [*] Đang chuẩn bị các tệp mã nguồn sạch (đã loại bỏ file rác & backup theo .gitignore)...
git add .

:: 5. Commit
echo [*] Đang đóng gói bản phát hành...
git commit -m "feat: HaHa Eco Travel ERP/CRM v1.0 Enterprise Release"

echo.
echo ===================================================================
echo [*] BƯỚC LIÊN KẾT VỚI REPOSITORY TRÊN GITHUB:
echo ===================================================================
echo.
echo 1. Hãy tạo 1 Repository mới trên https://github.com/new (nếu chưa tạo).
echo 2. Copy đường link Repository đó (Dạng: https://github.com/USERNAME/REPO_NAME.git)
echo.
set /p repo_url="Dán đường link GitHub của bạn vào đây (hoặc nhấn Enter để bỏ qua): "

if "%repo_url%"=="" (
    echo.
    echo [i] Bạn chưa nhập link GitHub. Các tệp đã được commit sẵn sàng trong máy.
    echo Khi nào có link, bạn chỉ cần gõ lệnh:
    echo   git remote add origin [LINK_CỦA_BẠN]
    echo   git push -u origin main
    echo.
    pause
    exit /b
)

:: 6. Thêm remote origin
git remote remove origin >nul 2>&1
git remote add origin %repo_url%

echo.
echo [*] Đang đẩy toàn bộ mã nguồn lên GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ===================================================================
    echo [OK] CHÚC MỪNG! DỰ ÁN ĐÃ ĐƯỢC ĐƯA LÊN GITHUB THÀNH CÔNG!
    echo ===================================================================
    echo Bây giờ bạn có thể liên kết Repository này với Vercel để tự động Deploy web!
    echo.
) else (
    echo.
    echo [!] Quá trình push chưa hoàn tất. Có thể bạn cần đăng nhập tài khoản GitHub
    echo     trên cửa sổ bật lên, hoặc kiểm tra lại quyền truy cập repository.
    echo.
)

pause
