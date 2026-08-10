Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9D739C632
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 22:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400355; cv=pass; b=HJPFYyfgMzGcrH2w1NpuryCCZRO4Kc15NU3vDtnTGClueSVhaY+6EbvcWsiOrWegKHyqjfzd3re3Fe8n8SAgJz5+V+YOeZ6aEVGaTdLeZD16KNNaCJd6HyVJHWdXzqQ4LdXCOlIvj1OkLsGrLXmImXnR4KBqd3Jk1JP9klTaIcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400355; c=relaxed/simple;
	bh=vfIc2n/bE2oddAwstk6unKCtfZaW5or+jlhpvREdR90=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VwQP5DB+8TDN9NYMebgpOmEQrVzOojHI27By2WM/3+n5vSxEgE2Saii6jD3PQg7mCA6vimdwqqhU6HcZ+mhT9F6JsNstZ21E1RUZRTQVeCKiSOIgWE/bhoPrzVCSoTEkdhDG5OEcjnqpfVkHX8gUKIDbNKrj7SoN5qWCfOs7ot8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aomjanC1; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aomjanC1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so2580985e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 15:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786400351; cv=none;
        d=google.com; s=arc-20260327;
        b=AUGMn0/tH8aLVAdgZUGTjx4YQFob3WdWFnCjS8BvzLrFhSiR9jtolsIgqv+VT6XBlr
         dbhxQazIPwN8zYY7RA0ZNoedwv7dH/bJgZJ86KqU8Gp1Az0MLExKerK5VdbNUbI+XgVF
         76Gy8ZTw+bSM/RQI9QwIVK2GsJlpR3l5ZmaGHmU4PMiBSKm+A819luobc0tlxx/jPIgz
         OAkIfGemBAy0Pn/rPtPP5sRG5vIyBI7OIMsw3L8mTyvxfAFVCJdzfa4exAv1mZkteKYO
         wvdRFZPrT3jiC/2zplYxfEg7bgjMh8S6saZOrqZu2bsVOCi3loL7gOqQxVC9RNDlNI1r
         J7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wApo2Os9DOMxJiDoIUlPqNDJnbj6WyChdIL/Dd+3c/o=;
        fh=wuZqzkV/uQl3Lx27/kiNyOzdA1cULOb4Q4mn/LcNlUg=;
        b=IKqpVBVr5tTWhgJMlqraYhIWOlvZO+rwZO7pyWdK3QYrrlfp/2ZGr2fUSiFCxAHefn
         z/2zAXjJut3lF+SOexh71F7xhHbOxmBsczSbV6Yn7E8oq4tV6JNxBLcKlEcCyZAgOhun
         L5zBx7ICe0YENqYK3S+eaDlJqUtk2NJNlrYhEMRCqYBuVCt8pP7oX8X2Fo+CnYDAJa1S
         N9qN+pp3E3Ae9+plb/4AeUzdhXjxL9917vZZLGm71UUIXq4ufAnqee95l1JhyMpkR7N8
         lOhL90M0EnD5hNy9zXqp0madjYQU+BPVyZdeobSJi32XxrPV5YGwPkzRj3zJ0Dtiss3e
         bmIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786400351; x=1787005151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wApo2Os9DOMxJiDoIUlPqNDJnbj6WyChdIL/Dd+3c/o=;
        b=aomjanC13uOaLcJT+Jw9rpzBbjQtM55pc3E3VzL2XzZV66S+AeIEvCkqcNUXWmFdGR
         r+lkd4MJEgkCuF8OoLxgyyyDRS423LfxGsyJEPwDLGGegmhiNmGQTk1P38XpqyS4JV/L
         q43yJfg+CT8BX617tOfrQwLbs30cwJfqsNJezGHxjdVOydJIpfauwQEc2AyKvgduCpbO
         Hwy8TK5uBk544a3Qm/dCEYzGrHJtBQCfMtpFpg1oEqj1gKyxBktBS87i+F8qiA66y2pL
         omZ2kjGBnP72NCW5Ba8JweAaZEKaJs9XqrutEjs2oXZ9Zc9pLf8F5OCjNH7+8BA/n2tg
         j/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786400351; x=1787005151;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wApo2Os9DOMxJiDoIUlPqNDJnbj6WyChdIL/Dd+3c/o=;
        b=sJAq/BioFK/3dIZcqo5jZlpZwn1befNtNXj9XNlUExT6GOY67w+bYWoihsCpzlZTBL
         UaolNRn0nqlYaHRtQlDQmkh5fUHEfFoPsxd8IGwR3Jw1UJ0fVkS7u9D2sYBLIyDJdS4u
         UedEPgTqpyb1MJfs1gPvgFTVB1Bc6eKMLf5t6LQH1IQhytBvVbFKcF2UnNFAMNbV0Ist
         bVes0k/u8SDKomg8l396W6d7VKhxQswIHkYwworhOPx2eZSuoE2n3Q+mpD21FVw3p05B
         cYM6rrOruIkOpDC+6Kw30kVJQqcreIQnwm6imiaoimMzdqTWRiLC7ybmb4MNfcpW9bTn
         x3Ww==
X-Forwarded-Encrypted: i=1; AHgh+RoUR/Ajb0npaqygmCBb4lfhKelj+2rM/UmLdxon9L+G6RRsLqM20NuOYEmaIz3bBwHRi/WVZjhuXZqHp+HCeOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YynxIZdf5BO/ZBQgybM94+9HDHiLrDoRB2OHNhj1UZFqhQnbxMb
	FShm2Au7OHkzoNkfu3mg0P7YJwXi7G1DWqwlCHr0YTkYQw1ZLWaCyAHUpRPq4end6/wf7fBpAY1
	EQp3kvslL0YMLNjePx8fjAYsMBOkm99LT0MkByHhcIw==
X-Gm-Gg: AR+sD12W1wUJfTJJZ7dWdc2C2PWIZ0UabaPFQ3Y2YZFYGXNsa3Q0OvFuT3QL/M2nKy+
	rJV8YInsF8G0GGuVZpYotc8Oc98YcXdq5U1B/9Vhw87ss8c1oBzEaLx8rBvMeel6rO0mTwdFuAr
	ykxhijyoGkCGjx2b6sJ0iREzPU1kjMl3MwYxsfr3I9qaJv6oriX6qthN5r6pRthzsq7KF52zviY
	EENNBn0ZQYJXIxh0B0djIxdItkviD+DQqvlKCTPNE+A11k53/IHV2Lu0TznamTy8D2/7+p4Tqr+
	6YJ2mcBvOd/bFCl0o5x4Fx7Rq4uuDjFYhiS5E7HO2zP3KyTHUIKL2Yq1i2gOCoh/rVaYnWLGal4
	Cbxel4DsW+HU7UxVVH1eJfZGskY1XeNV8nCJo9C8gJWE/aV1nYvZjZ+8wNuU=
X-Received: by 2002:a05:651c:221c:b0:39f:1b37:82bd with SMTP id
 38308e7fff4ca-39fe56dec18mr26298821fa.11.1786400351228; Mon, 10 Aug 2026
 15:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Darren Carreras <carrerasdarren@gmail.com>
Date: Mon, 10 Aug 2026 18:18:58 -0400
X-Gm-Features: AUfX_mxnlk3L8yNt0ijwIWYQcLthDwOVLOVpEqCKKhMsVDc5_Kr-34hOoFXhTBA
Message-ID: <CAOZ_Kyv0=7CTApDchNOhwFVDAim73K2eYPLpuwi9=341pYg40A@mail.gmail.com>
Subject: [PATCH bpf-next v4] libbpf: avoid overflow in BTF.ext bounds check
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, jolsa@kernel.org, yonghong.song@linux.dev, song@kernel.org, 
	martin.lau@linux.dev, memxor@gmail.com, daniel@iogearbox.net, ast@kernel.org, 
	ihor.solodrai@linux.dev, eddyz87@gmail.com, andrii@kernel.org
Content-Type: multipart/mixed; boundary="0000000000005caeda0658b8beb0"

--0000000000005caeda0658b8beb0
Content-Type: text/plain; charset="UTF-8"

An invalid BTF.ext subsection length can wrap the pointer addition used by
btf_ext_parse_sec_info() on 32-bit builds. The wrapped pointer passes the
bounds check and parsing then reads beyond the copied BTF.ext data.

Validate the offset and length with subtraction before forming the section
pointer.

Fixes: ae4ab4b4117d ("btf: expose API to work with raw btf_ext data")
Closes: https://issues.oss-fuzz.com/issues/477315119
Signed-off-by: Darren Carreras <carrerasdarren@gmail.com>
---
Changes in v4:
- Drop the selftest because the malformed length is already rejected by the
  old check on 64-bit CI; the behavioral divergence is specific to 32-bit.
- Correct the Fixes tag to the commit that introduced the pointer-based check.

Changes in v3:
- Remove the nested mbox envelope and mail headers from the Gmail attachment
  so Patchwork's generated mbox applies with git am.

Changes in v2:
- Resend as plain text because Gmail mangled the v1 diff and Patchwork
  reported "Patch is empty."
- Include the authorized DCO Signed-off-by line.

 tools/lib/bpf/btf.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index 8417de9..744f33e 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -3364,7 +3364,7 @@ static int btf_ext_parse_sec_info(struct btf_ext *btf_ext,
 {
  const struct btf_ext_info_sec *sinfo;
  struct btf_ext_info *ext_info;
- __u32 info_left, record_size;
+ __u32 data_left, info_left, record_size;
  size_t sec_cnt = 0;
  void *info;

@@ -3377,16 +3377,17 @@ static int btf_ext_parse_sec_info(struct
btf_ext *btf_ext,
  return -EINVAL;
  }

- /* The start of the info sec (including the __u32 record_size). */
- info = btf_ext->data + btf_ext->hdr->hdr_len + ext_sec->off;
- info_left = ext_sec->len;
-
- if (btf_ext->data + btf_ext->data_size < info + ext_sec->len) {
+ data_left = btf_ext->data_size - btf_ext->hdr->hdr_len;
+ if (ext_sec->off > data_left || ext_sec->len > data_left - ext_sec->off) {
  pr_debug("%s section (off:%u len:%u) is beyond the end of the ELF
section .BTF.ext\n",
  ext_sec->desc, ext_sec->off, ext_sec->len);
  return -EINVAL;
  }

+ /* The start of the info sec (including the __u32 record_size). */
+ info = btf_ext->data + btf_ext->hdr->hdr_len + ext_sec->off;
+ info_left = ext_sec->len;
+
  /* At least a record size */
  if (info_left < sizeof(__u32)) {
  pr_debug(".BTF.ext %s record size not found\n", ext_sec->desc);

--0000000000005caeda0658b8beb0
Content-Type: text/plain; charset="US-ASCII"; 
	name="v4-libbpf-avoid-overflow-in-BTF.ext-bounds-check-body.txt"
Content-Disposition: attachment; 
	filename="v4-libbpf-avoid-overflow-in-BTF.ext-bounds-check-body.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_msnsmo7x0>
X-Attachment-Id: f_msnsmo7x0

QW4gaW52YWxpZCBCVEYuZXh0IHN1YnNlY3Rpb24gbGVuZ3RoIGNhbiB3cmFwIHRoZSBwb2ludGVy
IGFkZGl0aW9uIHVzZWQgYnkKYnRmX2V4dF9wYXJzZV9zZWNfaW5mbygpIG9uIDMyLWJpdCBidWls
ZHMuIFRoZSB3cmFwcGVkIHBvaW50ZXIgcGFzc2VzIHRoZQpib3VuZHMgY2hlY2sgYW5kIHBhcnNp
bmcgdGhlbiByZWFkcyBiZXlvbmQgdGhlIGNvcGllZCBCVEYuZXh0IGRhdGEuCgpWYWxpZGF0ZSB0
aGUgb2Zmc2V0IGFuZCBsZW5ndGggd2l0aCBzdWJ0cmFjdGlvbiBiZWZvcmUgZm9ybWluZyB0aGUg
c2VjdGlvbgpwb2ludGVyLgoKRml4ZXM6IGFlNGFiNGI0MTE3ZCAoImJ0ZjogZXhwb3NlIEFQSSB0
byB3b3JrIHdpdGggcmF3IGJ0Zl9leHQgZGF0YSIpCkNsb3NlczogaHR0cHM6Ly9pc3N1ZXMub3Nz
LWZ1enouY29tL2lzc3Vlcy80NzczMTUxMTkKU2lnbmVkLW9mZi1ieTogRGFycmVuIENhcnJlcmFz
IDxjYXJyZXJhc2RhcnJlbkBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0OgotIERyb3AgdGhl
IHNlbGZ0ZXN0IGJlY2F1c2UgdGhlIG1hbGZvcm1lZCBsZW5ndGggaXMgYWxyZWFkeSByZWplY3Rl
ZCBieSB0aGUKICBvbGQgY2hlY2sgb24gNjQtYml0IENJOyB0aGUgYmVoYXZpb3JhbCBkaXZlcmdl
bmNlIGlzIHNwZWNpZmljIHRvIDMyLWJpdC4KLSBDb3JyZWN0IHRoZSBGaXhlcyB0YWcgdG8gdGhl
IGNvbW1pdCB0aGF0IGludHJvZHVjZWQgdGhlIHBvaW50ZXItYmFzZWQgY2hlY2suCgpDaGFuZ2Vz
IGluIHYzOgotIFJlbW92ZSB0aGUgbmVzdGVkIG1ib3ggZW52ZWxvcGUgYW5kIG1haWwgaGVhZGVy
cyBmcm9tIHRoZSBHbWFpbCBhdHRhY2htZW50CiAgc28gUGF0Y2h3b3JrJ3MgZ2VuZXJhdGVkIG1i
b3ggYXBwbGllcyB3aXRoIGdpdCBhbS4KCkNoYW5nZXMgaW4gdjI6Ci0gUmVzZW5kIGFzIHBsYWlu
IHRleHQgYmVjYXVzZSBHbWFpbCBtYW5nbGVkIHRoZSB2MSBkaWZmIGFuZCBQYXRjaHdvcmsKICBy
ZXBvcnRlZCAiUGF0Y2ggaXMgZW1wdHkuIgotIEluY2x1ZGUgdGhlIGF1dGhvcml6ZWQgRENPIFNp
Z25lZC1vZmYtYnkgbGluZS4KCiB0b29scy9saWIvYnBmL2J0Zi5jIHwgMTMgKysrKysrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90b29scy9saWIvYnBmL2J0Zi5jIGIvdG9vbHMvbGliL2JwZi9idGYuYwppbmRleCA4
NDE3ZGU5Li43NDRmMzNlIDEwMDY0NAotLS0gYS90b29scy9saWIvYnBmL2J0Zi5jCisrKyBiL3Rv
b2xzL2xpYi9icGYvYnRmLmMKQEAgLTMzNjQsNyArMzM2NCw3IEBAIHN0YXRpYyBpbnQgYnRmX2V4
dF9wYXJzZV9zZWNfaW5mbyhzdHJ1Y3QgYnRmX2V4dCAqYnRmX2V4dCwKIHsKIAljb25zdCBzdHJ1
Y3QgYnRmX2V4dF9pbmZvX3NlYyAqc2luZm87CiAJc3RydWN0IGJ0Zl9leHRfaW5mbyAqZXh0X2lu
Zm87Ci0JX191MzIgaW5mb19sZWZ0LCByZWNvcmRfc2l6ZTsKKwlfX3UzMiBkYXRhX2xlZnQsIGlu
Zm9fbGVmdCwgcmVjb3JkX3NpemU7CiAJc2l6ZV90IHNlY19jbnQgPSAwOwogCXZvaWQgKmluZm87
CiAKQEAgLTMzNzcsMTYgKzMzNzcsMTcgQEAgc3RhdGljIGludCBidGZfZXh0X3BhcnNlX3NlY19p
bmZvKHN0cnVjdCBidGZfZXh0ICpidGZfZXh0LAogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQkv
KiBUaGUgc3RhcnQgb2YgdGhlIGluZm8gc2VjIChpbmNsdWRpbmcgdGhlIF9fdTMyIHJlY29yZF9z
aXplKS4gKi8KLQlpbmZvID0gYnRmX2V4dC0+ZGF0YSArIGJ0Zl9leHQtPmhkci0+aGRyX2xlbiAr
IGV4dF9zZWMtPm9mZjsKLQlpbmZvX2xlZnQgPSBleHRfc2VjLT5sZW47Ci0KLQlpZiAoYnRmX2V4
dC0+ZGF0YSArIGJ0Zl9leHQtPmRhdGFfc2l6ZSA8IGluZm8gKyBleHRfc2VjLT5sZW4pIHsKKwlk
YXRhX2xlZnQgPSBidGZfZXh0LT5kYXRhX3NpemUgLSBidGZfZXh0LT5oZHItPmhkcl9sZW47CisJ
aWYgKGV4dF9zZWMtPm9mZiA+IGRhdGFfbGVmdCB8fCBleHRfc2VjLT5sZW4gPiBkYXRhX2xlZnQg
LSBleHRfc2VjLT5vZmYpIHsKIAkJcHJfZGVidWcoIiVzIHNlY3Rpb24gKG9mZjoldSBsZW46JXUp
IGlzIGJleW9uZCB0aGUgZW5kIG9mIHRoZSBFTEYgc2VjdGlvbiAuQlRGLmV4dFxuIiwKIAkJCSBl
eHRfc2VjLT5kZXNjLCBleHRfc2VjLT5vZmYsIGV4dF9zZWMtPmxlbik7CiAJCXJldHVybiAtRUlO
VkFMOwogCX0KIAorCS8qIFRoZSBzdGFydCBvZiB0aGUgaW5mbyBzZWMgKGluY2x1ZGluZyB0aGUg
X191MzIgcmVjb3JkX3NpemUpLiAqLworCWluZm8gPSBidGZfZXh0LT5kYXRhICsgYnRmX2V4dC0+
aGRyLT5oZHJfbGVuICsgZXh0X3NlYy0+b2ZmOworCWluZm9fbGVmdCA9IGV4dF9zZWMtPmxlbjsK
KwogCS8qIEF0IGxlYXN0IGEgcmVjb3JkIHNpemUgKi8KIAlpZiAoaW5mb19sZWZ0IDwgc2l6ZW9m
KF9fdTMyKSkgewogCQlwcl9kZWJ1ZygiLkJURi5leHQgJXMgcmVjb3JkIHNpemUgbm90IGZvdW5k
XG4iLCBleHRfc2VjLT5kZXNjKTsK
--0000000000005caeda0658b8beb0--
