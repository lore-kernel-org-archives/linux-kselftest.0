Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74B444236C
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786391112; cv=pass; b=sm3D8UCV+a9pPA+KLHNSzHkIJ1aRrt7F+V/YqBhE3L+Yte0zBGTWycF4BMe3H3T0A3I8qTFBrcUYIolD3uDAqojHRV8GnUfTKydGuCBq11sTntbRaJg0/WFK2r2Ee41eM0lrwh7ybNpsORPYMh01JXKszCtHw3FsdRk3wAdxGTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786391112; c=relaxed/simple;
	bh=ayhCbelXeibkQ/ssGNFjcIo4JDLENZg0awS4sJXuIHk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GozvEcnV4qMUtXACsffk3mvgX+Bjwwjidl/r2+p3shnB5+fnhvwr0ckc6huYdz/73axCpAR9yCdVoyQOohr86/htddBx8PMv+J0i9GlPnx3p5LLGEQjboXXvzNUi38K7e7BDt7lcn4jvDF60WTLDkFB5NcUH/N+e0grD4BwWLzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tto1U+rl; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tto1U+rl"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c74722e27so3432901fa.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 12:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786391109; cv=none;
        d=google.com; s=arc-20260327;
        b=COGYIohlV2HMkMR6ACMtVDf0dssOkuDVf2HIsunszhSAPvvZGaJdzEIP53vc8B/hK+
         fb8DblGkLI0I3yUy+RL3z3kyp/8t5LKHh8D6VZImRYs2U7ph/yGf1bh20L+YA4PDrsn/
         OU8T6zpYejt8WBBDUemwyu+UL6TbTv7sqVC9TfRBzhKgQ8Rhoe5PkYdbxhMdaNf+iouJ
         rPNDxqlcLOlT/qgfTg/mL51nOCh0/F9bL2zh/kQBlT2yb4wtGp5QaVl5fkgMCZWvn3nn
         v4EIkiIzNADgOMYuY2FBa/0PtSOGm927AdF59cKupXj3NvM/uVyDifzmlqPPKo118L2e
         54Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J4wuepwkPFMsZc+qF5Xy0emX71DH1Bhz909w8WYRlBg=;
        fh=09Q7Hnl/R0PdjF/xnm94e4VSVrzO+nNKet45P532ATM=;
        b=Z9iUqGwWzbB5EbFhUZv0iENNUcFXf52amaMkCU5x08BoPRCcHpMWWVopjVnmyVHWPN
         ci/e/+1aobD8atWtB757rs/Vk5J6Nyj1lbS2Vb7fdaPQs/PbTP7+4k747+7Fwdy684Py
         1EYB0q8yWxgecAstU35V43/irPFBWUbZ4IZZHcd6zcNrB8Yv8x5U/IGNLLeOYG9/N9Y6
         OV42oxLj5zrSWWhQLyLAE5/P4ayGMd+Mohx/VzyLmGkJcR9lxwKOPUrIBz/ublSadVSQ
         Lprxjh5JUZtaY5GlOL+MlcGv1p/ysh0cpjpYeOBJBM7HD2OPJ7CASX0l0bN/rCqv8OYU
         tLuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786391109; x=1786995909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J4wuepwkPFMsZc+qF5Xy0emX71DH1Bhz909w8WYRlBg=;
        b=Tto1U+rlifWOQ4krOj7H3stEcFQAUluydCV6KvUeCoRWGRRcio0Fgp1xE7XFt2i57w
         1AUqsxGmVOde1uVCNFLCP0L2pRi6UcBy92PQFB9NNfLNTRXtflV9jpGRK+41vhYeX5A0
         vOSfu2xYCqLPNZSXsgzBe7Hsv7ay0LDAc337SpYQAoXIwFsJdDBwWnYYNbKrIi9JrLDM
         7BLNxny57+O1YnwJgYv3vDNXEIBzxoW7DBqxpSju9VEO6Omm9RDuQdcoHSDF2JYJWcKz
         3H8+WJTcr1D5ppqDi0hhDdmlVqKdOwCLr0FO13lxEkSPoAo0BHrmAGTgHvt0cAHhwKoE
         rvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786391109; x=1786995909;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J4wuepwkPFMsZc+qF5Xy0emX71DH1Bhz909w8WYRlBg=;
        b=K1rIT7YDpWrQHVqYln4f1Rv95MId763iKldPMPCKhnZkmZPGd4R7SOIyBpTTOtceof
         N4Ji7nMyyGy+tOjK5zRNNfEsdeJxfz77dnKfhCSEH4XqpR7bgoBdGy/KtMvTTATt5LNX
         PO7CreV/bIGrxbUP+v4yQAd7lGLNpmJLGv12xS4WWxaD3tY+rLsvbIHLpGqQO/pymIUd
         COblO3rXDSLnUhbYQgogGAJZYTC1I+4y6xhn5iXkAyS4Ox64IKyxt+dwaNwkDtqUvRrH
         s+VyXGdSwkJNvS/57aPeDZFNQ6ISdqv/V9SsgF8ieVaIeKNc3RtZMq0iVvLTRyVq9hEx
         XjXg==
X-Forwarded-Encrypted: i=1; AHgh+RoEDd/qdnma81IRgh3y5aV5VYT9Y1VVwq9bV3+gOmonZ2ExBD5ZWsAjBYhzI4R+eHAthc1Itaym8nqa05lMkx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv1MqYJ2pL5rQDeX/BLC78F9CIF2nKtoy5dmJf2tpxg0J+ZcHh
	dQvA1+xeuhlZ8Fohg4vTirDoouR7AZBD0Toc0GMEQ3wgAaUPOkpZBEQSGNCW+4zVY9pYIm4wHcM
	lBt+R7KKGjtaoTvr2mB/Hc1vD10Lzo9I=
X-Gm-Gg: AR+sD10dUr1G5qGiFBh2xNlD+IKC2ujDqTPF3e8UOgg1kd1LuK8Rz191/uzPZYKgtf8
	T6JH6TtIv2LU/W/bp3FxtFSBpiO4fEUcZoy4osseKSCuupWF+uhXel5+0mi2boxI8K03mduaLJj
	sZ1ybF1igZPHclFAUGv78Qvuyel74L+m/a2E7kQCM5LXDMI9fQ3jp+0yQh8pILGT2/YqqvdJmFd
	gR++3nWYjkPN9x/ZmMP7FfYkqsT/ucUvsJ7fQfkAeTpMrpDfY0Yrds+uKLNu9zHsVh7I8Zy0GtG
	OFt6H8xK6DS/6yg7TbMuxwi8b9HUeNiWEC7x5KnZGUSMOGgMv4lZWMZa2nGFO2Ikgc9AUimHW+Z
	b8B6M2cY+og1HeJw9LzMsqQtv+/vPe3rESkDORyM1vfqGpaW6JKPVghtEd+ds1DjSkk8ytg==
X-Received: by 2002:a05:651c:542:b0:39a:c1dd:5399 with SMTP id
 38308e7fff4ca-3a0de7ae7acmr1158331fa.7.1786391108648; Mon, 10 Aug 2026
 12:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Darren Carreras <carrerasdarren@gmail.com>
Date: Mon, 10 Aug 2026 15:44:56 -0400
X-Gm-Features: AUfX_mz8g31skmUyNc_0IN8plTirbjJirEPSj4g4i8srWGJ1SnHsWkvpAGeV9E8
Message-ID: <CAOZ_KyvMmC8Sa1Yiaqe2istdxYrc0fpeF7RHEb_UeGD046nqig@mail.gmail.com>
Subject: [PATCH bpf-next v3] libbpf: avoid overflow in BTF.ext bounds check
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, jolsa@kernel.org, yonghong.song@linux.dev, song@kernel.org, 
	martin.lau@linux.dev, memxor@gmail.com, daniel@iogearbox.net, ast@kernel.org, 
	ihor.solodrai@linux.dev, eddyz87@gmail.com, andrii@kernel.org
Content-Type: multipart/mixed; boundary="00000000000076219e0658b697c2"

--00000000000076219e0658b697c2
Content-Type: text/plain; charset="UTF-8"



--00000000000076219e0658b697c2
Content-Type: text/plain; charset="US-ASCII"; 
	name="v3-libbpf-avoid-overflow-in-BTF.ext-bounds-check-body.txt"
Content-Disposition: attachment; 
	filename="v3-libbpf-avoid-overflow-in-BTF.ext-bounds-check-body.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_msnn4qra0>
X-Attachment-Id: f_msnn4qra0

QW4gaW52YWxpZCBCVEYuZXh0IHN1YnNlY3Rpb24gbGVuZ3RoIGNhbiB3cmFwIHRoZSBwb2ludGVy
IGFkZGl0aW9uIHVzZWQgYnkKYnRmX2V4dF9wYXJzZV9zZWNfaW5mbygpIG9uIDMyLWJpdCBidWls
ZHMuIFRoZSB3cmFwcGVkIHBvaW50ZXIgcGFzc2VzIHRoZQpib3VuZHMgY2hlY2sgYW5kIHBhcnNp
bmcgdGhlbiByZWFkcyBiZXlvbmQgdGhlIGNvcGllZCBCVEYuZXh0IGRhdGEuCgpWYWxpZGF0ZSB0
aGUgb2Zmc2V0IGFuZCBsZW5ndGggd2l0aCBzdWJ0cmFjdGlvbiBiZWZvcmUgZm9ybWluZyB0aGUg
c2VjdGlvbgpwb2ludGVyLiBBZGQgYSBzZWxmdGVzdCB1c2luZyBhbiBvdmVyZmxvd2luZyBmdW5j
X2luZm9fbGVuLgoKRml4ZXM6IGNmNTc5MTY0ZTllYSAoImxpYmJwZjogU3VwcG9ydCBCVEYuZXh0
IGxvYWRpbmcgYW5kIG91dHB1dCBpbiBlaXRoZXIgZW5kaWFubmVzcyIpCgpDbG9zZXM6IGh0dHBz
Oi8vaXNzdWVzLm9zcy1mdXp6LmNvbS9pc3N1ZXMvNDc3MzE1MTE5ClNpZ25lZC1vZmYtYnk6IERh
cnJlbiBDYXJyZXJhcyA8Y2FycmVyYXNkYXJyZW5AZ21haWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2
MzoKLSBSZW1vdmUgdGhlIG5lc3RlZCBtYm94IGVudmVsb3BlIGFuZCBtYWlsIGhlYWRlcnMgZnJv
bSB0aGUgR21haWwgYXR0YWNobWVudAogIHNvIFBhdGNod29yaydzIGdlbmVyYXRlZCBtYm94IGFw
cGxpZXMgd2l0aCBnaXQgYW0uCgpDaGFuZ2VzIGluIHYyOgotIFJlc2VuZCBhcyBwbGFpbiB0ZXh0
IGJlY2F1c2UgR21haWwgbWFuZ2xlZCB0aGUgdjEgZGlmZiBhbmQgUGF0Y2h3b3JrCiAgcmVwb3J0
ZWQgIlBhdGNoIGlzIGVtcHR5LiIKLSBJbmNsdWRlIHRoZSBhdXRob3JpemVkIERDTyBTaWduZWQt
b2ZmLWJ5IGxpbmUuCgogdG9vbHMvbGliL2JwZi9idGYuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTMgKysrKystLS0tLQogLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy90ZXN0X2J0
Zl9leHQuYyAgIHwgMjQgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9icGYv
YnRmLmMgYi90b29scy9saWIvYnBmL2J0Zi5jCmluZGV4IDg0MTdkZTkuLjc0NGYzM2UgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2xpYi9icGYvYnRmLmMKKysrIGIvdG9vbHMvbGliL2JwZi9idGYuYwpAQCAt
MzM2NCw3ICszMzY0LDcgQEAgc3RhdGljIGludCBidGZfZXh0X3BhcnNlX3NlY19pbmZvKHN0cnVj
dCBidGZfZXh0ICpidGZfZXh0LAogewogCWNvbnN0IHN0cnVjdCBidGZfZXh0X2luZm9fc2VjICpz
aW5mbzsKIAlzdHJ1Y3QgYnRmX2V4dF9pbmZvICpleHRfaW5mbzsKLQlfX3UzMiBpbmZvX2xlZnQs
IHJlY29yZF9zaXplOworCV9fdTMyIGRhdGFfbGVmdCwgaW5mb19sZWZ0LCByZWNvcmRfc2l6ZTsK
IAlzaXplX3Qgc2VjX2NudCA9IDA7CiAJdm9pZCAqaW5mbzsKIApAQCAtMzM3NywxNiArMzM3Nywx
NyBAQCBzdGF0aWMgaW50IGJ0Zl9leHRfcGFyc2Vfc2VjX2luZm8oc3RydWN0IGJ0Zl9leHQgKmJ0
Zl9leHQsCiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCS8qIFRoZSBzdGFydCBvZiB0aGUgaW5m
byBzZWMgKGluY2x1ZGluZyB0aGUgX191MzIgcmVjb3JkX3NpemUpLiAqLwotCWluZm8gPSBidGZf
ZXh0LT5kYXRhICsgYnRmX2V4dC0+aGRyLT5oZHJfbGVuICsgZXh0X3NlYy0+b2ZmOwotCWluZm9f
bGVmdCA9IGV4dF9zZWMtPmxlbjsKLQotCWlmIChidGZfZXh0LT5kYXRhICsgYnRmX2V4dC0+ZGF0
YV9zaXplIDwgaW5mbyArIGV4dF9zZWMtPmxlbikgeworCWRhdGFfbGVmdCA9IGJ0Zl9leHQtPmRh
dGFfc2l6ZSAtIGJ0Zl9leHQtPmhkci0+aGRyX2xlbjsKKwlpZiAoZXh0X3NlYy0+b2ZmID4gZGF0
YV9sZWZ0IHx8IGV4dF9zZWMtPmxlbiA+IGRhdGFfbGVmdCAtIGV4dF9zZWMtPm9mZikgewogCQlw
cl9kZWJ1ZygiJXMgc2VjdGlvbiAob2ZmOiV1IGxlbjoldSkgaXMgYmV5b25kIHRoZSBlbmQgb2Yg
dGhlIEVMRiBzZWN0aW9uIC5CVEYuZXh0XG4iLAogCQkJIGV4dF9zZWMtPmRlc2MsIGV4dF9zZWMt
Pm9mZiwgZXh0X3NlYy0+bGVuKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJLyogVGhlIHN0
YXJ0IG9mIHRoZSBpbmZvIHNlYyAoaW5jbHVkaW5nIHRoZSBfX3UzMiByZWNvcmRfc2l6ZSkuICov
CisJaW5mbyA9IGJ0Zl9leHQtPmRhdGEgKyBidGZfZXh0LT5oZHItPmhkcl9sZW4gKyBleHRfc2Vj
LT5vZmY7CisJaW5mb19sZWZ0ID0gZXh0X3NlYy0+bGVuOworCiAJLyogQXQgbGVhc3QgYSByZWNv
cmQgc2l6ZSAqLwogCWlmIChpbmZvX2xlZnQgPCBzaXplb2YoX191MzIpKSB7CiAJCXByX2RlYnVn
KCIuQlRGLmV4dCAlcyByZWNvcmQgc2l6ZSBub3QgZm91bmRcbiIsIGV4dF9zZWMtPmRlc2MpOwpk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMvdGVzdF9i
dGZfZXh0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy90ZXN0X2J0
Zl9leHQuYwppbmRleCA3ZDFiNDc4Li43N2RiODdkIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy90ZXN0X2J0Zl9leHQuYworKysgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ190ZXN0cy90ZXN0X2J0Zl9leHQuYwpAQCAtMSw5ICsxLDMx
IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAogLyogQ29weXJpZ2h0IChj
KSAyMDI1IE1ldGEgUGxhdGZvcm1zIEluYy4gKi8KICNpbmNsdWRlIDx0ZXN0X3Byb2dzLmg+Cisj
aW5jbHVkZSAiYnBmL2xpYmJwZl9pbnRlcm5hbC5oIgogI2luY2x1ZGUgInRlc3RfYnRmX2V4dC5z
a2VsLmgiCiAjaW5jbHVkZSAiYnRmX2hlbHBlcnMuaCIKIAorc3RhdGljIHZvaWQgc3VidGVzdF9p
bnZhbGlkX2luZm9fbGVuKHZvaWQpCit7CisJc3RydWN0IHsKKwkJc3RydWN0IGJ0Zl9leHRfaGVh
ZGVyIGhkcjsKKwkJX191MzIgcmVjb3JkX3NpemU7CisJfSByYXcgPSB7CisJCS5oZHIgPSB7CisJ
CQkubWFnaWMgPSBCVEZfTUFHSUMsCisJCQkudmVyc2lvbiA9IEJURl9WRVJTSU9OLAorCQkJLmhk
cl9sZW4gPSBzaXplb2YocmF3LmhkciksCisJCQkuZnVuY19pbmZvX2xlbiA9IFVJTlQzMl9NQVgg
LSA3LAorCQl9LAorCQkucmVjb3JkX3NpemUgPSBzaXplb2Yoc3RydWN0IGJwZl9mdW5jX2luZm9f
bWluKSwKKwl9OworCXN0cnVjdCBidGZfZXh0ICpidGZfZXh0OworCisJYnRmX2V4dCA9IGJ0Zl9l
eHRfX25ldygodm9pZCAqKSZyYXcsIHNpemVvZihyYXcpKTsKKwlpZiAoIUFTU0VSVF9FUlJfUFRS
KGJ0Zl9leHQsICJpbnZhbGlkX2luZm9fbGVuIikpCisJCWJ0Zl9leHRfX2ZyZWUoYnRmX2V4dCk7
Cit9CisKIHN0YXRpYyB2b2lkIHN1YnRlc3RfbGluZV9mdW5jX2luZm8odm9pZCkKIHsKIAlzdHJ1
Y3QgdGVzdF9idGZfZXh0ICpza2VsOwpAQCAtNTksNiArODEsOCBAQCBzdGF0aWMgdm9pZCBzdWJ0
ZXN0X2xpbmVfZnVuY19pbmZvKHZvaWQpCiAKIHZvaWQgdGVzdF9idGZfZXh0KHZvaWQpCiB7CisJ
aWYgKHRlc3RfX3N0YXJ0X3N1YnRlc3QoImludmFsaWRfaW5mb19sZW4iKSkKKwkJc3VidGVzdF9p
bnZhbGlkX2luZm9fbGVuKCk7CiAJaWYgKHRlc3RfX3N0YXJ0X3N1YnRlc3QoImxpbmVfZnVuY19p
bmZvIikpCiAJCXN1YnRlc3RfbGluZV9mdW5jX2luZm8oKTsKIH0K
--00000000000076219e0658b697c2--
