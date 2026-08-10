Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4132C3195FD
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 22:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786401209; cv=pass; b=qhIbyi1hEJdQNg2LW7dBJsFu1BTAaezwBR2eUVscZCIX9wRU+5w/D2TfBwuV5mgPVJb0hI6FYTodFSl9KFoXIb00sAO3o6CPmlMyZrJ7y3qg3RctowmP4G6RMVN5KcBp+Zjy5GnCwqlUxMnC36heUDuHvWUp4/K/6/HYFv8XI0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786401209; c=relaxed/simple;
	bh=Tg9xRpc1WXewMgxZVABLzvXqiigCDgPIk39FCFXFpQo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SKBUp2vnCVKBb2nkbZC5gleQMkAVBJCNY63RW5EKemyT9Vjhx+xrB4EIaFmd9AmhZ/RbjBZjSBSSmQrpBOpqOmR90jW7KRfBu69fOW+4d2BkG2AAjjLo36JIQzzCs/7/sPTOwDWtITnkSFg/7m8FLZldURfLm+l64hx5B9E0z1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnFoJ/zu; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnFoJ/zu"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39ee96f8047so15387311fa.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 15:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786401206; cv=none;
        d=google.com; s=arc-20260327;
        b=E5eBK+sSrb8gQPlgRxDyHCdGV/JF9dnsDSh2AxRTQNjQpbeyq0rZEKXeJokFzqH3Zo
         kehBYH7bCTJlZ0DYU3tsdVBQhnqEzRt69XM8bOawqYs0alhVDrqLmG4QLmHp1+/jyqqR
         zg5y3DgLgo3igjYlnVuhNwB6q+z6DtpoHD9acEwIJ88GVXWKOA6QfqWATszZicuJslbu
         jFIgd+yn93WyrRFditRxv5ZhwpMNA2aFkWk8ZPgEg758+zdonoWEL5IrodGEYxFd0kgK
         SoObo5Mcx6qLDKHTa2GlmBMRdsoQ7w2AYe0N89A6DtyeeGQ50ZisOR6Aza3RCVnS8/Ch
         JjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ozXtc4neLgrQ0Z4k4ooMYRHrbRa09iWpdvHd0UYRFrY=;
        fh=msT7uky/OGisT30STzb5iy4gzVO6bN/abNdrvoEXv48=;
        b=sDIN/RKUoz4dU/n9vmMDJVm8t3qnw4BESZbAaYyXezT6wmoZ0VhVD/3EY5ogbcA+jr
         JZafkTVgCmoNILAvrqxDAmHTXnCn9yq5ZGfVvf8xYZVjSVV9Zq9YMI3s578cndlPPfiz
         GJeGaKzQXC1wAc0NaNB3+HTe2X89PczxoRcThrRzOd9TRSqqlG3FsZYx3uIo5yfPQyKo
         ZekdWHOMTQfUUsKh9udZti41UFpZZZPXiWwHeRO9nrvTsQa4y2Pjw/UgNv89p8BakfNh
         X6zKxrztBjduww6hcKqIaKkPSQotRcw/ZU9CxjVXGi2ymK/bGbhqJc67DxSRFOwEljYq
         +K7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786401206; x=1787006006; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozXtc4neLgrQ0Z4k4ooMYRHrbRa09iWpdvHd0UYRFrY=;
        b=RnFoJ/zuWrtWqgHFR9u6X6lwOnuuADUxo7Bqv3U56cqg+kPWs96khQUBhhApi3tAjj
         I+gIeznUTCQ19ehl/NZgEXnh3A4+Ef2mUoaD4ecw+ptPCKk6GNa01o0W/SnGWDrUhWji
         9R2PnrfdSs00dez9T2y2Lb2MXm87IX3rcdIKP5YnnWQWUYCQngG2b/kEuTWoOIGkNHKJ
         lUiQNMosCAx1Tnx3jOdhGlAmny0qZQjmMCRtN22ruYkZ6zf7zKISS2AWrGyQKzV8f8lI
         BARgf5EispCNFBnZAG/pIPpt2YQMQq8plu+FwcPGwEXrs8Q18ZEGTRS+psyyQqhP82aD
         cZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786401206; x=1787006006;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ozXtc4neLgrQ0Z4k4ooMYRHrbRa09iWpdvHd0UYRFrY=;
        b=mAIKd5nBFpRv/arQ4FI5x3OWwgpAA9kAlVcW/V+D9BZpxyRhBxPT7skuVIpth7EqAC
         YiOBupPexktqlYIzB6qOb3C22OKGU+YByoIYZi4RFgvMEfPTJ4lZLRn3jp3wPIv5y81d
         bmKCOnpLnqTw5Zdr+e7W8tueHt9B6li2/jjR3CzEcvGjg3i0usktzJvi24+uMygANVHG
         7KSodhu0dO9baVtdep1x6KpWhEQS6FpkHHD/5P17ztU1+YG3IdRaFZrx4kpER5rSdfjy
         kWY5u1TD4HkgOGHY66lAe2lTGUTuh7rRXlkjIu32chlAiKp4BsKRfg6YQLP4DP5bBh4C
         wkmg==
X-Forwarded-Encrypted: i=1; AHgh+RqFAxbR0Ymhpr2KswT7WZhZseC6iU6pxpQPi+fisjOiXL/MvC/AP9wTthriE3UWxrYYws4o5zVFtgoFe4ncgas=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw2CyyAfs2Og57ZBvnXSHGs3p+Z3h6DLQ75NKGexOMBbIdEz8p
	xSNzuSKzJbEA59v4HMx1dpZ9frcF8iBOTCZe1uNU8SVsauI7lfanH2Ojh2rXp3sw+IR88QTMHAf
	0W9+SUZJLorAfaLls+oT690X4zS3NWe8=
X-Gm-Gg: AR+sD11CMsq6qh1lrVE6zJNtKrmTJb+ulqGmXyqVBaOI6cmEY5hdi4lUVyVVqkXkv69
	1BUzZgmrAQySYS1TF+7jIG4dpCLWKDdflM01qhLC+tpR4YZ55MtCptVVCTpGzLDm1ep4BR1hLfp
	LEABEtVCIBodFr+7V0lBJqAKcF/v9xgIGHRpe30OijHwf3w3kNWWrrF+5crxpNGr8rpJhU1ErO9
	mK27WOnEbrmfe8gM39OaB/WQ+gamScYmreT5+RwPiKX+P+ApngaWpMcw3KszqwmX8EGAhAEi4tu
	8oq4UNOqLbSZjVabHghaq8aXzSe8kUSSHnwxyaPKcSTtsPYrnXAfd0LnUzh5SoRnRoFbNbjqj6s
	UMbdAck89zUR/iyppLmejEgk8+4uMJgDuuaJ5cu8uH1zKORj2cG3Neg08a0Q=
X-Received: by 2002:a05:651c:2227:b0:39c:7922:b446 with SMTP id
 38308e7fff4ca-3a00e92f0acmr6770071fa.14.1786401206305; Mon, 10 Aug 2026
 15:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Darren Carreras <carrerasdarren@gmail.com>
Date: Mon, 10 Aug 2026 18:33:14 -0400
X-Gm-Features: AUfX_myVIXbJRGl1gg-c3nl3CCYj5Hn1YHhK51lrmdbTXUegSV6eEhMXshul4I8
Message-ID: <CAOZ_KyvEkVnT+jakLfeSfs0g5yq6t6YvVJ9humZfyQ-6OKSW6Q@mail.gmail.com>
Subject: [PATCH bpf-next v5] libbpf: avoid overflow in BTF.ext bounds check
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, jolsa@kernel.org, yonghong.song@linux.dev, song@kernel.org, 
	martin.lau@linux.dev, memxor@gmail.com, daniel@iogearbox.net, ast@kernel.org, 
	ihor.solodrai@linux.dev, eddyz87@gmail.com, andrii@kernel.org
Content-Type: multipart/mixed; boundary="000000000000541d820658b8f19e"

--000000000000541d820658b8f19e
Content-Type: text/plain; charset="UTF-8"



--000000000000541d820658b8f19e
Content-Type: text/plain; charset="US-ASCII"; 
	name="v5-libbpf-avoid-overflow-in-BTF.ext-bounds-check-body.txt"
Content-Disposition: attachment; 
	filename="v5-libbpf-avoid-overflow-in-BTF.ext-bounds-check-body.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_msnt4vg00>
X-Attachment-Id: f_msnt4vg00

QW4gaW52YWxpZCBCVEYuZXh0IHN1YnNlY3Rpb24gbGVuZ3RoIGNhbiB3cmFwIHRoZSBwb2ludGVy
IGFkZGl0aW9uIHVzZWQgYnkKYnRmX2V4dF9wYXJzZV9zZWNfaW5mbygpIG9uIDMyLWJpdCBidWls
ZHMuIFRoZSB3cmFwcGVkIHBvaW50ZXIgcGFzc2VzIHRoZQpib3VuZHMgY2hlY2sgYW5kIHBhcnNp
bmcgdGhlbiByZWFkcyBiZXlvbmQgdGhlIGNvcGllZCBCVEYuZXh0IGRhdGEuCgpWYWxpZGF0ZSB0
aGUgb2Zmc2V0IGFuZCBsZW5ndGggd2l0aCBzdWJ0cmFjdGlvbiBiZWZvcmUgZm9ybWluZyB0aGUg
c2VjdGlvbgpwb2ludGVyLgoKRml4ZXM6IGFlNGFiNGI0MTE3ZCAoImJ0ZjogZXhwb3NlIEFQSSB0
byB3b3JrIHdpdGggcmF3IGJ0Zl9leHQgZGF0YSIpCkNsb3NlczogaHR0cHM6Ly9pc3N1ZXMub3Nz
LWZ1enouY29tL2lzc3Vlcy80NzczMTUxMTkKU2lnbmVkLW9mZi1ieTogRGFycmVuIENhcnJlcmFz
IDxjYXJyZXJhc2RhcnJlbkBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY1OgotIFJlc2VuZCBm
cm9tIGEgY2xlYW4gY29tcG9zZSB3aW5kb3cgYmVjYXVzZSBHbWFpbCByZXRhaW5lZCBhIHN0YWxl
IHJpY2gtdGV4dAogIGNvcHkgYmVzaWRlIHRoZSB2NCBhdHRhY2htZW50LCBwcm9kdWNpbmcgYSBk
dXBsaWNhdGVkIG1hbGZvcm1lZCBwYXRjaCBib2R5LgoKQ2hhbmdlcyBpbiB2NDoKLSBEcm9wIHRo
ZSBzZWxmdGVzdCBiZWNhdXNlIHRoZSBtYWxmb3JtZWQgbGVuZ3RoIGlzIGFscmVhZHkgcmVqZWN0
ZWQgYnkgdGhlCiAgb2xkIGNoZWNrIG9uIDY0LWJpdCBDSTsgdGhlIGJlaGF2aW9yYWwgZGl2ZXJn
ZW5jZSBpcyBzcGVjaWZpYyB0byAzMi1iaXQuCi0gQ29ycmVjdCB0aGUgRml4ZXMgdGFnIHRvIHRo
ZSBjb21taXQgdGhhdCBpbnRyb2R1Y2VkIHRoZSBwb2ludGVyLWJhc2VkIGNoZWNrLgoKQ2hhbmdl
cyBpbiB2MzoKLSBSZW1vdmUgdGhlIG5lc3RlZCBtYm94IGVudmVsb3BlIGFuZCBtYWlsIGhlYWRl
cnMgZnJvbSB0aGUgR21haWwgYXR0YWNobWVudAogIHNvIFBhdGNod29yaydzIGdlbmVyYXRlZCBt
Ym94IGFwcGxpZXMgd2l0aCBnaXQgYW0uCgpDaGFuZ2VzIGluIHYyOgotIFJlc2VuZCBhcyBwbGFp
biB0ZXh0IGJlY2F1c2UgR21haWwgbWFuZ2xlZCB0aGUgdjEgZGlmZiBhbmQgUGF0Y2h3b3JrCiAg
cmVwb3J0ZWQgIlBhdGNoIGlzIGVtcHR5LiIKLSBJbmNsdWRlIHRoZSBhdXRob3JpemVkIERDTyBT
aWduZWQtb2ZmLWJ5IGxpbmUuCgogdG9vbHMvbGliL2JwZi9idGYuYyB8IDEzICsrKysrKystLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvbGliL2JwZi9idGYuYyBiL3Rvb2xzL2xpYi9icGYvYnRmLmMKaW5kZXgg
ODQxN2RlOS4uNzQ0ZjMzZSAxMDA2NDQKLS0tIGEvdG9vbHMvbGliL2JwZi9idGYuYworKysgYi90
b29scy9saWIvYnBmL2J0Zi5jCkBAIC0zMzY0LDcgKzMzNjQsNyBAQCBzdGF0aWMgaW50IGJ0Zl9l
eHRfcGFyc2Vfc2VjX2luZm8oc3RydWN0IGJ0Zl9leHQgKmJ0Zl9leHQsCiB7CiAJY29uc3Qgc3Ry
dWN0IGJ0Zl9leHRfaW5mb19zZWMgKnNpbmZvOwogCXN0cnVjdCBidGZfZXh0X2luZm8gKmV4dF9p
bmZvOwotCV9fdTMyIGluZm9fbGVmdCwgcmVjb3JkX3NpemU7CisJX191MzIgZGF0YV9sZWZ0LCBp
bmZvX2xlZnQsIHJlY29yZF9zaXplOwogCXNpemVfdCBzZWNfY250ID0gMDsKIAl2b2lkICppbmZv
OwogCkBAIC0zMzc3LDE2ICszMzc3LDE3IEBAIHN0YXRpYyBpbnQgYnRmX2V4dF9wYXJzZV9zZWNf
aW5mbyhzdHJ1Y3QgYnRmX2V4dCAqYnRmX2V4dCwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0J
LyogVGhlIHN0YXJ0IG9mIHRoZSBpbmZvIHNlYyAoaW5jbHVkaW5nIHRoZSBfX3UzMiByZWNvcmRf
c2l6ZSkuICovCi0JaW5mbyA9IGJ0Zl9leHQtPmRhdGEgKyBidGZfZXh0LT5oZHItPmhkcl9sZW4g
KyBleHRfc2VjLT5vZmY7Ci0JaW5mb19sZWZ0ID0gZXh0X3NlYy0+bGVuOwotCi0JaWYgKGJ0Zl9l
eHQtPmRhdGEgKyBidGZfZXh0LT5kYXRhX3NpemUgPCBpbmZvICsgZXh0X3NlYy0+bGVuKSB7CisJ
ZGF0YV9sZWZ0ID0gYnRmX2V4dC0+ZGF0YV9zaXplIC0gYnRmX2V4dC0+aGRyLT5oZHJfbGVuOwor
CWlmIChleHRfc2VjLT5vZmYgPiBkYXRhX2xlZnQgfHwgZXh0X3NlYy0+bGVuID4gZGF0YV9sZWZ0
IC0gZXh0X3NlYy0+b2ZmKSB7CiAJCXByX2RlYnVnKCIlcyBzZWN0aW9uIChvZmY6JXUgbGVuOiV1
KSBpcyBiZXlvbmQgdGhlIGVuZCBvZiB0aGUgRUxGIHNlY3Rpb24gLkJURi5leHRcbiIsCiAJCQkg
ZXh0X3NlYy0+ZGVzYywgZXh0X3NlYy0+b2ZmLCBleHRfc2VjLT5sZW4pOwogCQlyZXR1cm4gLUVJ
TlZBTDsKIAl9CiAKKwkvKiBUaGUgc3RhcnQgb2YgdGhlIGluZm8gc2VjIChpbmNsdWRpbmcgdGhl
IF9fdTMyIHJlY29yZF9zaXplKS4gKi8KKwlpbmZvID0gYnRmX2V4dC0+ZGF0YSArIGJ0Zl9leHQt
Pmhkci0+aGRyX2xlbiArIGV4dF9zZWMtPm9mZjsKKwlpbmZvX2xlZnQgPSBleHRfc2VjLT5sZW47
CisKIAkvKiBBdCBsZWFzdCBhIHJlY29yZCBzaXplICovCiAJaWYgKGluZm9fbGVmdCA8IHNpemVv
ZihfX3UzMikpIHsKIAkJcHJfZGVidWcoIi5CVEYuZXh0ICVzIHJlY29yZCBzaXplIG5vdCBmb3Vu
ZFxuIiwgZXh0X3NlYy0+ZGVzYyk7Cg==
--000000000000541d820658b8f19e--
