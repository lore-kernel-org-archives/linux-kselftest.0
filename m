Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA533A8FE6
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660392; cv=pass; b=u7lhcgZ1AYGJJt+H4mLdPy5AdQ2DfJh7Qm6e5fPhft93A/Li3yoIG2d982d5Qsu62OiILas2RBztkbXuORVouposM951nFcDGNCxbYHTB+9N1Ix4aTA8e/9k/tfqdCF3n6HIPIKalkkvCZXzC/DRvRZ+JKGguoncrwr26DX58EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660392; c=relaxed/simple;
	bh=FOIcLM0bxNwc2XeqBek8fVKkqkawxUbpIvQ7cUMtiTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuNk6RxY0+Mn03v+sSqJJhTK2cc7rG6YbzmV8is3VjrWjgcGWJXHHQbyh2ZvoNOYjMs3xLAWypf1MrqLHsXqmpztZHKqyhTZQT4PVbybz0IwdK7uQvq2hWFMCjw/yhlQZzlZfhk20PLVIJqgF415QRAA+Ta6niBclW9V6YB6o0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFkxe72Q; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFkxe72Q"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce7d2adef4so7203365ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 15:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786660389; cv=none;
        d=google.com; s=arc-20260327;
        b=XCAViJIBlZBGg1eY2ZmlFw3wYAtxrzG39htobWd7wsBbKIjrYUZj82D9Uass2iYKUM
         K5qk8YK5rHi1CPN0mAqX4hNXz0s+/yNN4zVDFMyA7sP8OJX73KQn3J/eb+J2wrULPNTj
         WIOOD/LCyP55wIhhPczCJP8xxUj3kNiU8mJyZoA7XPuVuVuE2+x2p0Ny9TVI+AeEG8uh
         kJC7dXY7+iyuokQzupt26jMIe8kavELAeC7PsC4+jZb0eyFUpoZA2va3+xMeqSsXFnTY
         ZWNUA3fuRxJzgluwLqFXpESHgJOGPTARJTEFGLd3t1+JNOJDwvNjkJO3u30a1+MN9FaY
         fd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5m9qkWkkiGrMe/7E1EC5e0bYS8Dyu5QZ1EmRVUDZfQ4=;
        fh=JYzJ/b7kyFfpuaLuusOv4dE3hAf0CdIvMnlgqNzgPbI=;
        b=ntBohBJGM5Qgr45OfM6vBNU6JwPn6gj7buDeiyqz8HleLOdRej4ojXZi8CrsDYDPx3
         O7eLWGSYKUJ7kJN6ilEoaccByneDrbqGGkHV1G7JWBXACvkQipXGZdfC7zUI8Zj0lOYJ
         3XdvAE5MzwXzfYLmIicBAT/D0Z1s309OWT9rjjFKld6WrMzIcqYevOKmO58phZHOEVXc
         FtPJkg205wvu/QKPueHPhFT3BbEn99bJddHv/zuajVzRtfN5j1MeI9ePiR7IjXVV3naG
         R+KZDli4TMZsMikJmuxbImLyuX9IBvOT7mItznKoSliYhXpMixSrr0I0Hf+go/3S+Qga
         YqMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786660389; x=1787265189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5m9qkWkkiGrMe/7E1EC5e0bYS8Dyu5QZ1EmRVUDZfQ4=;
        b=JFkxe72QWAr2L0wE+w4jPF8fx5iV4JbqlCCGvKaKuPrbME2nWYiSGXsMVEX2opRCAF
         sxInSPiedtrsrQwUJIE9PH9VoSLlO/F/nMe/BquQv6cxxJsFZxTbdTVx6hpmQEhmKUlL
         tGP5MrCDpImwLj9wwjEti1nVAumndQMyLzkerODxgRnVzA8EqO1BegqHz6uMi9GfcG2h
         r7jWSmou9tRRN1/5qjMQV7Y0ZqdAjn1Vi2bm99zl4h8zoUNv9f+DUimmDUjMR9ODKHQC
         hhqb3nETHG2G08E0bwW/oi6BOVI/+1Qyj3/h/g27xJCodaQuNKZTEgQYn515XFJMqX/D
         voQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786660389; x=1787265189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5m9qkWkkiGrMe/7E1EC5e0bYS8Dyu5QZ1EmRVUDZfQ4=;
        b=S3YxNkwbeUdmKIUCp3DGPU59ZelAy0zobJstyNxzX0uY88Ezq3kWlw+ljyLFuWTR5m
         1Q5xQOuHLo1EgswNRl8bIRxYhvSvW2hQVLFbCNYGT/VaH3Jn43Ze2wF9Jd7jjH7BUp0I
         nSxTg5253M1Uj32ZPSuarbn5r8wyMEJ7aLwfqFVPnaXslDxe2NTWEOZ46sCXHHjMbjXn
         RnCFNpmqUlokIuvkArCV00x/jc97H+Dv6959UZwd2ro3zJcWGfspT0Vp8mmZxSx07EYD
         ppEKUVwrU+crM10ro10G1ecIYufdk/B4IvMG49DXSufOei5TWGbNo0pUUWwfRzpWReS0
         314g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4NCsFAmhYtLqeL6sQcA2EzkAhOVCn//aFg1K7xVB00DXFtkjBy+GsfFR2JPxHB5GFRPFRu8rCzjw0lkjY0eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyBP6oy4b2lkui4kpQizeHJN1a4kRzMcAQxHF4FgmeUm38Xvb
	nfkT7AJpdrCdIQqcEKNbsmB3+2RQtUrin1aJHRUSGgLKhFMVJGjhQAyY6nvkrkoWHV5w5To+yTk
	im0kq27A4C2uomL/BjcBd6IdywXMNuQY=
X-Gm-Gg: AR+sD13yME0FDaImBmftVAEn6d7ncvLHXeOo9CM8pZL7i8IYRWl/TFqLCAeNmIATva7
	BUbqlJgq5ct1/rIbxw5bISX3NvpJ+e+9rdgyGehPb8Fz9xTEWbLgRDkW12B1Qyj/nLQyqu0gvYc
	ny8oHywafyO2OmdNL7iPKgTs7BM0MmK8eE4w+XrOSDLbC67F/KY1IZsq/dgdoAUo130iHDzYsZ3
	Eueo55ACkMrU0Wyv7c0ncPob96XXAl6cEpNwcLKU9EOC015nadG3bMPY0Sxtnj7YThHUVdAiycT
	2a3BfmLWlBDInLErooLLVLTbTMEf8pPHRprVk0S4jJ95UIIsr+Z1KymHfL2TrBhg2fW11NnAwaC
	aMjrVF2QDdcrpILLxsqKM8YAC5l1qsG3TogtqDisdCVX8xlvqA5tL
X-Received: by 2002:a05:6a21:4c85:b0:3c3:8ead:6df0 with SMTP id
 adf61e73a8af0-3cc71cd5375mr1269370637.28.1786660389082; Thu, 13 Aug 2026
 15:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOZ_KysLYww+5TT8LQO-xNnubktwfyKYtxgAsBt44S-XmZHMVg@mail.gmail.com>
In-Reply-To: <CAOZ_KysLYww+5TT8LQO-xNnubktwfyKYtxgAsBt44S-XmZHMVg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 13 Aug 2026 15:32:54 -0700
X-Gm-Features: AUfX_mxT17JJwLGy8aDu7XINDMUSp0FKiOTW8mCr8vntYc-TE5fvuf5i7N2oy8E
Message-ID: <CAEf4BzYUgrxxZ2DbXDe+bweKENhzNeeN5EnrG0D2xwLmm-yrTQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5] libbpf: avoid overflow in BTF.ext bounds check
To: Darren Carreras <carrerasdarren@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, jolsa@kernel.org, 
	yonghong.song@linux.dev, song@kernel.org, martin.lau@linux.dev, 
	memxor@gmail.com, daniel@iogearbox.net, ast@kernel.org, 
	ihor.solodrai@linux.dev, eddyz87@gmail.com, andrii@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 9:49=E2=80=AFAM Darren Carreras
<carrerasdarren@gmail.com> wrote:
>
> An invalid BTF.ext subsection length can wrap the pointer addition used b=
y
> btf_ext_parse_sec_info() on 32-bit builds. The wrapped pointer passes the
> bounds check and parsing then reads beyond the copied BTF.ext data.
>
> Validate the offset and length with subtraction before forming the sectio=
n
> pointer.
>
> Fixes: ae4ab4b4117d ("btf: expose API to work with raw btf_ext data")
> Closes: https://issues.oss-fuzz.com/issues/477315119
> Signed-off-by: Darren Carreras <carrerasdarren@gmail.com>
> ---
> Changes in v5:
> - Rebase onto bpf-next commit d114bb989367.
> - Attach one diff-only patch; the v4 MIME body contained a duplicated dif=
f and
>   could not be applied by CI.
>
> Changes in v4:
> - Drop the selftest because the malformed length is already rejected by t=
he
>   old check on 64-bit CI; the behavioral divergence is specific to 32-bit=
.
> - Correct the Fixes tag to the commit that introduced the pointer-based c=
heck.
>
> Changes in v3:
> - Remove the nested mbox envelope and mail headers from the Gmail attachm=
ent
>   so Patchwork's generated mbox applies with git am.
>
> Changes in v2:
> - Resend as plain text because Gmail mangled the v1 diff and Patchwork
>   reported "Patch is empty."
> - Include the authorized DCO Signed-off-by line.


It's hard to review and reply because you didn't post patch inline
(please don't do this for subsequent contributions), but here's the
gist:

- /* The start of the info sec (including the __u32 record_size). */
- info =3D btf_ext->data + btf_ext->hdr->hdr_len + ext_sec->off;
- info_left =3D ext_sec->len;
-
- if (btf_ext->data + btf_ext->data_size < info + ext_sec->len) {
+ data_left =3D btf_ext->data_size - btf_ext->hdr->hdr_len;

From what I understand, you are trying to protect against corrupted
ELF that specifies invalid .BTF.ext ELF section size, is that right?

And your fix makes another assumption that btf_ext->hdr->hdr_len is
definitely not malformed, because otherwise this  btf_ext->data_size -
btf_ext->hdr->hdr_len can underflow, no?

So in both cases, if ELF or BTF content is corrupted, there might be a prob=
lem.


+ if (ext_sec->off > data_left || ext_sec->len > data_left - ext_sec->off) =
{
  pr_debug("%s section (off:%u len:%u) is beyond the end of the ELF
section .BTF.ext\n",
  ext_sec->desc, ext_sec->off, ext_sec->len);
  return -EINVAL;
  }

+ /* The start of the info sec (including the __u32 record_size). */
+ info =3D btf_ext->data + btf_ext->hdr->hdr_len + ext_sec->off;
+ info_left =3D ext_sec->len;
+
