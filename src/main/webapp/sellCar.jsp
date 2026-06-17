<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="headerForAll.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="Đăng tin bán xe ô tô cũ nhanh chóng, dễ dàng trên Car Store">
    <title>Đăng bán xe - Car Store</title>
    <link rel="stylesheet" href="css/sellCar.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="sell-wrapper">
    <!-- Page Header -->
    <div class="sell-header">
        <h1><i class="fas fa-car"></i> Đăng tin bán xe</h1>
        <p>Điền đầy đủ thông tin để tin đăng của bạn nổi bật hơn</p>
    </div>
    <!-- Progress Bar -->
    <div class="progress-wrap">
        <div class="progress-step active" id="step-ind-1">
            <div class="step-circle">1</div>
            <span>Thông tin xe</span>
        </div>
        <div class="progress-line"></div>
        <div class="progress-step" id="step-ind-2">
            <div class="step-circle">2</div>
            <span>Thông số kỹ thuật</span>
        </div>
        <div class="progress-line"></div>
        <div class="progress-step" id="step-ind-3">
            <div class="step-circle">3</div>
            <span>Mô tả &amp; Hình ảnh</span>
        </div>
    </div>
    <form id="sellForm" action="UploadCarToSellServlet" method="post" enctype="multipart/form-data" novalidate>
        <!-- ══════════════════════════════════════
             BƯỚC 1: Thông tin cơ bản
        ══════════════════════════════════════ -->
        <div class="form-step active" id="step-1">
            <div class="form-card">
                <div class="card-title"><i class="fas fa-info-circle"></i> Thông tin cơ bản</div>
                <div class="form-grid">
                    <!-- Hãng xe -->
                    <div class="form-group" id="grp-brand">
                        <label for="brand">Hãng xe <span class="required">*</span></label>
                        <select id="brand" name="brand" required>
                            <option value="">-- Chọn hãng xe --</option>
                            <c:forEach var="b" items="${brands}">
                                <option value="${b.name}" data-id="${b.id}">${b.name}</option>
                            </c:forEach>
                        </select>
                        <span class="field-error" id="err-brand"></span>
                    </div>
                    <!-- Dòng xe (cascade) -->
                    <div class="form-group" id="grp-model">
                        <label for="model">Dòng xe <span class="required">*</span></label>
                        <select id="model" name="model" required disabled>
                            <option value="">-- Chọn hãng xe trước --</option>
                        </select>
                        <span class="field-error" id="err-model"></span>
                    </div>
                    <!-- Năm sản xuất -->
                    <div class="form-group" id="grp-year">
                        <label for="year">Năm sản xuất <span class="required">*</span></label>
                        <select id="year" name="year" required>
                            <option value="">-- Chọn năm --</option>
                            <c:forEach begin="0" end="36" var="i">
                                <c:set var="y" value="${2026 - i}"/>
                                <option value="${y}">${y}</option>
                            </c:forEach>
                        </select>
                        <span class="field-error" id="err-year"></span>
                    </div>
                    <!-- Số km đã đi -->
                    <div class="form-group" id="grp-mileage">
                        <label for="mileage">Số km đã đi <span class="required">*</span></label>
                        <div class="input-unit-wrap">
                            <input type="number" id="mileage" name="mileage"
                                   min="0" max="1000000" placeholder="Ví dụ: 45000" required>
                            <span class="unit">km</span>
                        </div>
                        <span class="field-hint">Từ 0 đến 1.000.000 km</span>
                        <span class="field-error" id="err-mileage"></span>
                    </div>
                    <!-- Giá bán -->
                    <div class="form-group" id="grp-price">
                        <label for="price">Giá bán <span class="required">*</span></label>
                        <div class="input-unit-wrap">
                            <input type="number" id="price" name="price"
                                   min="10000000" max="50000000000"
                                   placeholder="Ví dụ: 850000000" required>
                            <span class="unit">VNĐ</span>
                        </div>
                        <span class="field-hint" id="price-display">Từ 10 triệu đến 50 tỷ VNĐ</span>
                        <span class="field-error" id="err-price"></span>
                    </div>
                    <!-- Tỉnh / Thành phố -->
                    <div class="form-group" id="grp-location">
                        <label for="location">Tỉnh / Thành phố <span class="required">*</span></label>
                        <select id="location" name="location" required>
                            <option value="">-- Chọn tỉnh thành --</option>
                            <option>An Giang</option><option>Bà Rịa - Vũng Tàu</option>
                            <option>Bắc Giang</option><option>Bắc Kạn</option>
                            <option>Bạc Liêu</option><option>Bắc Ninh</option>
                            <option>Bến Tre</option><option>Bình Định</option>
                            <option>Bình Dương</option><option>Bình Phước</option>
                            <option>Bình Thuận</option><option>Cà Mau</option>
                            <option>Cần Thơ</option><option>Cao Bằng</option>
                            <option>Đà Nẵng</option><option>Đắk Lắk</option>
                            <option>Đắk Nông</option><option>Điện Biên</option>
                            <option>Đồng Nai</option><option>Đồng Tháp</option>
                            <option>Gia Lai</option><option>Hà Giang</option>
                            <option>Hà Nam</option><option>Hà Nội</option>
                            <option>Hà Tĩnh</option><option>Hải Dương</option>
                            <option>Hải Phòng</option><option>Hậu Giang</option>
                            <option>Hòa Bình</option><option>Hưng Yên</option>
                            <option>Khánh Hòa</option><option>Kiên Giang</option>
                            <option>Kon Tum</option><option>Lai Châu</option>
                            <option>Lâm Đồng</option><option>Lạng Sơn</option>
                            <option>Lào Cai</option><option>Long An</option>
                            <option>Nam Định</option><option>Nghệ An</option>
                            <option>Ninh Bình</option><option>Ninh Thuận</option>
                            <option>Phú Thọ</option><option>Phú Yên</option>
                            <option>Quảng Bình</option><option>Quảng Nam</option>
                            <option>Quảng Ngãi</option><option>Quảng Ninh</option>
                            <option>Quảng Trị</option><option>Sóc Trăng</option>
                            <option>Sơn La</option><option>Tây Ninh</option>
                            <option>Thái Bình</option><option>Thái Nguyên</option>
                            <option>Thanh Hóa</option><option>Thừa Thiên Huế</option>
                            <option>Tiền Giang</option><option>TP. Hồ Chí Minh</option>
                            <option>Trà Vinh</option><option>Tuyên Quang</option>
                            <option>Vĩnh Long</option><option>Vĩnh Phúc</option>
                            <option>Yên Bái</option>
                        </select>
                        <span class="field-error" id="err-location"></span>
                    </div>
                </div>
            </div>
            <div class="step-actions">
                <span></span>
                <button type="button" class="btn-next" onclick="goNext(1)">
                    Tiếp theo <i class="fas fa-arrow-right"></i>
                </button>
            </div>
        </div>
        <!-- ══════════════════════════════════════
             BƯỚC 2: Thông số kỹ thuật
        ══════════════════════════════════════ -->
        <div class="form-step" id="step-2">
            <div class="form-card">
                <div class="card-title"><i class="fas fa-cogs"></i> Thông số kỹ thuật</div>
                <div class="form-grid">
                    <!-- Số chỗ ngồi -->
                    <div class="form-group" id="grp-seat">
                        <label for="seat_Count">Số chỗ ngồi <span class="required">*</span></label>
                        <select id="seat_Count" name="seat_Count" required>
                            <option value="">-- Chọn số chỗ --</option>
                            <option value="2">2 chỗ</option>
                            <option value="4">4 chỗ</option>
                            <option value="5">5 chỗ</option>
                            <option value="7">7 chỗ</option>
                            <option value="8">8 chỗ</option>
                            <option value="9">9 chỗ</option>
                            <option value="12">12 chỗ</option>
                            <option value="16">16 chỗ</option>
                        </select>
                        <span class="field-error" id="err-seat"></span>
                    </div>
                    <!-- Loại nhiên liệu -->
                    <div class="form-group" id="grp-fuel">
                        <label for="fuel_type">Loại nhiên liệu <span class="required">*</span></label>
                        <select id="fuel_type" name="fuel_type" required>
                            <option value="">-- Chọn nhiên liệu --</option>
                            <c:forEach var="f" items="${fuelTypes}">
                                <option value="${f}">${f}</option>
                            </c:forEach>
                        </select>
                        <span class="field-error" id="err-fuel"></span>
                    </div>
                    <!-- Kích thước: Dài -->
                    <div class="form-group" id="grp-dim-l">
                        <label for="dim_length">Chiều dài (mm) <span class="required">*</span></label>
                        <div class="input-unit-wrap">
                            <input type="number" id="dim_length" name="dim_length"
                                   min="2000" max="7000" placeholder="Ví dụ: 4885" required>
                            <span class="unit">mm</span>
                        </div>
                        <span class="field-error" id="err-dim-l"></span>
                    </div>
                    <!-- Kích thước: Rộng -->
                    <div class="form-group" id="grp-dim-w">
                        <label for="dim_width">Chiều rộng (mm) <span class="required">*</span></label>
                        <div class="input-unit-wrap">
                            <input type="number" id="dim_width" name="dim_width"
                                   min="1200" max="3000" placeholder="Ví dụ: 1840" required>
                            <span class="unit">mm</span>
                        </div>
                        <span class="field-error" id="err-dim-w"></span>
                    </div>
                    <!-- Kích thước: Cao -->
                    <div class="form-group" id="grp-dim-h">
                        <label for="dim_height">Chiều cao (mm) <span class="required">*</span></label>
                        <div class="input-unit-wrap">
                            <input type="number" id="dim_height" name="dim_height"
                                   min="1000" max="2500" placeholder="Ví dụ: 1445" required>
                            <span class="unit">mm</span>
                        </div>
                        <span class="field-error" id="err-dim-h"></span>
                    </div>
                    <!-- Trọng lượng -->
                    <div class="form-group" id="grp-weight">
                        <label for="weight">Tự trọng (kg) <span class="required">*</span></label>
                        <div class="input-unit-wrap">
                            <input type="number" id="weight" name="weight"
                                   min="800" max="4000" placeholder="Ví dụ: 1515" required>
                            <span class="unit">kg</span>
                        </div>
                        <span class="field-hint">Từ 800 đến 4.000 kg</span>
                        <span class="field-error" id="err-weight"></span>
                    </div>
                    <!-- Khoảng sáng gầm -->
                    <div class="form-group" id="grp-gc">
                        <label for="ground_clearance">Khoảng sáng gầm (mm) <span class="required">*</span></label>
                        <div class="input-unit-wrap">
                            <input type="number" id="ground_clearance" name="ground_clearance"
                                   min="100" max="350" placeholder="Ví dụ: 140" required>
                            <span class="unit">mm</span>
                        </div>
                        <span class="field-hint">Từ 100 đến 350 mm</span>
                        <span class="field-error" id="err-gc"></span>
                    </div>
                    <!-- La-zăng -->
                    <div class="form-group" id="grp-wheel">
                        <label for="wheels">Kích thước la-zăng <span class="required">*</span></label>
                        <select id="wheels" name="wheels" required>
                            <option value="">-- Chọn cỡ la-zăng --</option>
                            <c:forEach var="w" items="${wheelSizes}">
                                <option value="${w}">${w}</option>
                            </c:forEach>
                        </select>
                        <span class="field-error" id="err-wheel"></span>
                    </div>
                    <!-- Động cơ (autocomplete) -->
                    <div class="form-group full-width" id="grp-engine">
                        <label for="engine">Động cơ <span class="required">*</span></label>
                        <input type="text" id="engine" name="engine"
                               list="engine-list"
                               placeholder="Ví dụ: 2.5L I4 DOHC hoặc 1.5L VTEC Turbo" required>
                        <datalist id="engine-list">
                            <option value="1.0L Turbo">
                            <option value="1.5L VTEC Turbo">
                            <option value="1.5L Skyactiv-G">
                            <option value="2.0L I4 Tăng áp">
                            <option value="2.0L TwinPower Turbo">
                            <option value="2.0L Bi-Turbo Diesel">
                            <option value="2.5L I4 DOHC Dual VVT-i">
                            <option value="2.2L Diesel">
                            <option value="3.5L V6">
                            <option value="Electric Motor">
                        </datalist>
                        <span class="field-hint">Có thể gõ tự do hoặc chọn từ gợi ý</span>
                        <span class="field-error" id="err-engine"></span>
                    </div>
                </div>
            </div>
            <div class="step-actions">
                <button type="button" class="btn-back" onclick="goBack(2)">
                    <i class="fas fa-arrow-left"></i> Quay lại
                </button>
                <button type="button" class="btn-next" onclick="goNext(2)">
                    Tiếp theo <i class="fas fa-arrow-right"></i>
                </button>
            </div>
        </div>
        <!-- ══════════════════════════════════════
             BƯỚC 3: Mô tả & Hình ảnh
        ══════════════════════════════════════ -->
        <div class="form-step" id="step-3">
            <div class="form-card">
                <div class="card-title"><i class="fas fa-file-alt"></i> Mô tả &amp; Hình ảnh</div>
                <div class="form-grid">
                    <!-- Tiêu đề tin đăng (auto-generated, readonly) -->
                    <div class="form-group full-width">
                        <label for="title-display">Tiêu đề tin đăng</label>
                        <input type="text" id="title-display"
                               placeholder="Tiêu đề tự động từ thông tin xe bên trên"
                               readonly style="background:rgba(0,0,0,0.04);cursor:not-allowed;">
                        <span class="field-hint">Tiêu đề được tạo tự động từ hãng xe, dòng xe và năm sản xuất</span>
                    </div>
                    <!-- Mô tả -->
                    <div class="form-group full-width" id="grp-desc">
                        <label for="description">Mô tả chi tiết <span class="required">*</span></label>
                        <textarea id="description" name="description" rows="6"
                                  placeholder="Mô tả tình trạng xe, lịch sử bảo dưỡng, các trang bị thêm, lý do bán...&#10;Ví dụ: Xe một chủ từ mới, bảo dưỡng định kỳ tại hãng, nội thất như mới..." required></textarea>
                        <div class="char-count"><span id="desc-count">0</span> / 2000 ký tự</div>
                        <span class="field-error" id="err-desc"></span>
                    </div>
                    <!-- Upload ảnh -->
                    <div class="form-group full-width" id="grp-image">
                        <label>Hình ảnh xe <span class="required">*</span></label>
                        <div class="upload-area" id="upload-area"
                             onclick="document.getElementById('image').click()"
                             ondragover="event.preventDefault()"
                             ondrop="handleDrop(event)">
                            <i class="fas fa-cloud-upload-alt"></i>
                            <p>Nhấn để chọn ảnh hoặc kéo thả vào đây</p>
                            <span>JPG, PNG, WEBP — Tối đa 10MB</span>
                        </div>
                        <input type="file" id="image" name="image"
                               accept="image/*" required style="display:none"
                               onchange="previewImage(this)">
                        <div id="img-preview-wrap" style="display:none;margin-top:12px;">
                            <img id="img-preview" src="" alt="Preview"
                                 style="max-width:100%;max-height:260px;border-radius:10px;object-fit:cover;">
                            <button type="button" class="btn-remove-img"
                                    onclick="removeImage()"><i class="fas fa-times"></i> Xóa ảnh</button>
                        </div>
                        <span class="field-error" id="err-image"></span>
                    </div>
                </div>
            </div>
            <div class="step-actions">
                <button type="button" class="btn-back" onclick="goBack(3)">
                    <i class="fas fa-arrow-left"></i> Quay lại
                </button>
                <button type="submit" class="btn-submit" id="btn-submit">
                    <i class="fas fa-paper-plane"></i> Đăng bán xe
                </button>
            </div>
        </div>
    </form>
</div>
<!-- Footer -->
<%@ include file="footer.jsp" %>
<script>
    // ── Cascading: Hãng → Dòng xe ──────────────────────────────
    document.getElementById('brand').addEventListener('change', function () {
        const sel = this.options[this.selectedIndex];
        const brandId = sel.getAttribute('data-id');
        const modelSel = document.getElementById('model');
        modelSel.innerHTML = '<option value="">-- Đang tải... --</option>';
        modelSel.disabled = true;
        if (!brandId) {
            modelSel.innerHTML = '<option value="">-- Chọn hãng xe trước --</option>';
            return;
        }
        fetch('api/models?brandId=' + brandId)
            .then(r => r.json())
            .then(data => {
                modelSel.innerHTML = '<option value="">-- Chọn dòng xe --</option>';
                data.forEach(m => {
                    const opt = document.createElement('option');
                    opt.value = m.modelName;
                    opt.textContent = m.modelName;
                    modelSel.appendChild(opt);
                });
                modelSel.disabled = false;
                updateTitlePreview();
            })
            .catch(() => {
                modelSel.innerHTML = '<option value="">-- Lỗi tải dữ liệu --</option>';
            });
    });
    // ── Auto-title preview ──────────────────────────────────────
    function updateTitlePreview() {
        const brand = document.getElementById('brand').value;
        const model = document.getElementById('model').value;
        const year  = document.getElementById('year').value;
        const title = document.getElementById('title-display');
        if (brand && model && year)
            title.value = 'Bán ' + brand + ' ' + model + ' ' + year + ' - Chính chủ';
        else
            title.value = '';
    }
    document.getElementById('model').addEventListener('change', updateTitlePreview);
    document.getElementById('year').addEventListener('change', updateTitlePreview);
    // ── Format giá VNĐ realtime ────────────────────────────────
    document.getElementById('price').addEventListener('input', function () {
        const v = parseInt(this.value);
        const display = document.getElementById('price-display');
        if (!isNaN(v) && v > 0) {
            display.textContent = '≈ ' + formatVND(v);
            display.style.color = '#10b981';
        } else {
            display.textContent = 'Từ 10 triệu đến 50 tỷ VNĐ';
            display.style.color = '';
        }
    });
    function formatVND(n) {
        if (n >= 1_000_000_000) return (n / 1_000_000_000).toFixed(2).replace(/\.?0+$/, '') + ' tỷ VNĐ';
        if (n >= 1_000_000)     return (n / 1_000_000).toFixed(1).replace(/\.?0+$/, '') + ' triệu VNĐ';
        return n.toLocaleString('vi-VN') + ' VNĐ';
    }
    // ── Đếm ký tự mô tả ───────────────────────────────────────
    document.getElementById('description').addEventListener('input', function () {
        document.getElementById('desc-count').textContent = this.value.length;
    });
    // ── Preview ảnh ────────────────────────────────────────────
    function previewImage(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = e => {
                document.getElementById('img-preview').src = e.target.result;
                document.getElementById('img-preview-wrap').style.display = 'block';
                document.getElementById('upload-area').style.display = 'none';
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    function removeImage() {
        document.getElementById('image').value = '';
        document.getElementById('img-preview-wrap').style.display = 'none';
        document.getElementById('upload-area').style.display = 'flex';
    }
    function handleDrop(e) {
        e.preventDefault();
        const file = e.dataTransfer.files[0];
        if (file && file.type.startsWith('image/')) {
            const dt = new DataTransfer();
            dt.items.add(file);
            document.getElementById('image').files = dt.files;
            previewImage(document.getElementById('image'));
        }
    }
    // ── Multi-step navigation ──────────────────────────────────
    function goNext(step) {
        if (!validateStep(step)) return;
        document.getElementById('step-' + step).classList.remove('active');
        document.getElementById('step-' + (step + 1)).classList.add('active');
        updateIndicators(step + 1);
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
    function goBack(step) {
        document.getElementById('step-' + step).classList.remove('active');
        document.getElementById('step-' + (step - 1)).classList.add('active');
        updateIndicators(step - 1);
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
    function updateIndicators(current) {
        [1, 2, 3].forEach(i => {
            const ind = document.getElementById('step-ind-' + i);
            ind.classList.toggle('active', i === current);
            ind.classList.toggle('done', i < current);
        });
    }
    // ── Validation ─────────────────────────────────────────────
    function setError(fieldId, errId, msg) {
        const el = document.getElementById(fieldId);
        if (el) el.classList.toggle('is-invalid', !!msg);
        const errEl = document.getElementById(errId);
        if (errEl) errEl.textContent = msg || '';
    }
    function clearError(fieldId, errId) { setError(fieldId, errId, ''); }
    function validateStep(step) {
        let ok = true;
        if (step === 1) {
            if (!document.getElementById('brand').value)
            { setError('brand','err-brand','Vui lòng chọn hãng xe'); ok=false; }
            else clearError('brand','err-brand');
            if (!document.getElementById('model').value)
            { setError('model','err-model','Vui lòng chọn dòng xe'); ok=false; }
            else clearError('model','err-model');
            if (!document.getElementById('year').value)
            { setError('year','err-year','Vui lòng chọn năm sản xuất'); ok=false; }
            else clearError('year','err-year');
            const mil = parseInt(document.getElementById('mileage').value);
            if (isNaN(mil) || mil < 0 || mil > 1000000)
            { setError('mileage','err-mileage','Số km phải từ 0 đến 1.000.000'); ok=false; }
            else clearError('mileage','err-mileage');
            const pr = parseInt(document.getElementById('price').value);
            if (isNaN(pr) || pr < 10000000 || pr > 50000000000)
            { setError('price','err-price','Giá phải từ 10 triệu đến 50 tỷ VNĐ'); ok=false; }
            else clearError('price','err-price');
            if (!document.getElementById('location').value)
            { setError('location','err-location','Vui lòng chọn tỉnh thành'); ok=false; }
            else clearError('location','err-location');
        }
        if (step === 2) {
            if (!document.getElementById('seat_Count').value)
            { setError('seat_Count','err-seat','Vui lòng chọn số chỗ ngồi'); ok=false; }
            else clearError('seat_Count','err-seat');
            if (!document.getElementById('fuel_type').value)
            { setError('fuel_type','err-fuel','Vui lòng chọn loại nhiên liệu'); ok=false; }
            else clearError('fuel_type','err-fuel');
            const dl = parseInt(document.getElementById('dim_length').value);
            if (isNaN(dl)||dl<2000||dl>7000)
            { setError('dim_length','err-dim-l','Chiều dài phải từ 2.000 đến 7.000 mm'); ok=false; }
            else clearError('dim_length','err-dim-l');
            const dw = parseInt(document.getElementById('dim_width').value);
            if (isNaN(dw)||dw<1200||dw>3000)
            { setError('dim_width','err-dim-w','Chiều rộng phải từ 1.200 đến 3.000 mm'); ok=false; }
            else clearError('dim_width','err-dim-w');
            const dh = parseInt(document.getElementById('dim_height').value);
            if (isNaN(dh)||dh<1000||dh>2500)
            { setError('dim_height','err-dim-h','Chiều cao phải từ 1.000 đến 2.500 mm'); ok=false; }
            else clearError('dim_height','err-dim-h');
            const wt = parseInt(document.getElementById('weight').value);
            if (isNaN(wt)||wt<800||wt>4000)
            { setError('weight','err-weight','Trọng lượng phải từ 800 đến 4.000 kg'); ok=false; }
            else clearError('weight','err-weight');
            const gc = parseInt(document.getElementById('ground_clearance').value);
            if (isNaN(gc)||gc<100||gc>350)
            { setError('ground_clearance','err-gc','Khoảng sáng gầm phải từ 100 đến 350 mm'); ok=false; }
            else clearError('ground_clearance','err-gc');
            if (!document.getElementById('wheels').value)
            { setError('wheels','err-wheel','Vui lòng chọn kích thước la-zăng'); ok=false; }
            else clearError('wheels','err-wheel');
            if (!document.getElementById('engine').value.trim())
            { setError('engine','err-engine','Vui lòng nhập thông tin động cơ'); ok=false; }
            else clearError('engine','err-engine');
        }
        return ok;
    }
    // ── Validate bước 3 trước khi submit ──────────────────────
    document.getElementById('sellForm').addEventListener('submit', function (e) {
        let ok = true;
        if (!document.getElementById('description').value.trim())
        { setError('description','err-desc','Vui lòng nhập mô tả xe'); ok=false; }
        else clearError('description','err-desc');
        if (!document.getElementById('image').files.length)
        { document.getElementById('err-image').textContent = 'Vui lòng chọn ảnh xe'; ok=false; }
        else document.getElementById('err-image').textContent = '';
        if (!ok) e.preventDefault();
    });
</script>
</body>
</html>