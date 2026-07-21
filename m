Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A548097E
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630161; cv=pass; b=MCu9qFXUDtk/pq3F9F+ue3wTNQDmSW4PEyLcGCZAg+iV98phgX+9jHx8q8OO+iDmBoZ+G34RE4PBG8cuQbw0WNu7RDsyaK5gVt+VXY0cD336AtPFyl0mCMtucQJ/rhBaVHoKt0o2EXehPEX8sMERIFMoOzHPyMLbAQHdzCy9Pw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630161; c=relaxed/simple;
	bh=rYViphB4DxfaPGMMntEonSPLt1Abt8g/0zJq2r3L3xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkqkGSgrQosp0H2rW/VR95wY8txqICyJjZU/hBN/QoxSF1fGlnlz3vYYKbB4jUuWPxKaZmu4COrLiPbLlYHze1pj+cu2ubUcGW4MOoOaXKP/LgWGyVLUEKgYxdZouQvUaLWcsUyyizSY0oUg+9k5wWh5N/VHwgCkaIo71+X1Szc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHo0+dCB; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHo0+dCB"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so13021287a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 03:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630158; cv=none;
        d=google.com; s=arc-20260327;
        b=AClXVjTk+yV3EGWBkQ+mRomK9I9ckNXhJvFhvaboUVKMDxC1guQ0SlCo9sI0dukAT/
         9S3N1g0/AVbFqMN8q+xUcyWuSW9WGi/2u5smGZ0RIes6e1ZqjpMTcZ9jLzFK+x/YYvJm
         +Po8MYFlaJKkfyVbhVijxyoUcyvjKh580gMQxqPp3ZoqZgAjFDtEpjHqTzrWXoMtTlJX
         VnSBNPeI+Ax5oiLIyfnYtGW9MHAcI0EczHl1USkJiJ6THpAkqXW8cFQVB0KWbS3U4aIC
         gnb+qB2GIkrADrk+VVHQAnaGAzVS2RY3TpczSmLVwtLyHUHBBIixbSKrjP8Ua0iGfhp6
         D/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6gkln8TC+X7dROBQSudVEuyKf8Opd2LeVjHp6RExug=;
        fh=t24egY8WFX+Iz4TrF+nhtm/WEhfeB6H3ScTiXvebSzw=;
        b=adzCtITH5mvSRpttB0la5NUHdIeVejPoXxvXlLNi7IfuWHChvgsl3o2aecQH2/+hWj
         Hyg50EENmojy3rP7QDYQghNbYV+t8IhDV1DlkeOuBkwQApPEwaYNRFebCcQ5Fq5bZo/+
         tE6VeoV1oKt98DDSF05QouJgHrMe4zGQOYz6P1yuIVa0fWHdI1lHbdNftUzK+EAxFSQ7
         wcj3LLTLD5+sUpz+BgHE0GM9WK98/H66XtVLVdqf++tlRyT/uU2JswVuP3vZN+Jx6KOl
         2CsBBkJMYnUkvbXo8mRN8gtsFUX3rZ6psbe+6pzaZKo5T5fmRNtqyeIxGxU8Vp/uIUOG
         /M+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630158; x=1785234958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R6gkln8TC+X7dROBQSudVEuyKf8Opd2LeVjHp6RExug=;
        b=tHo0+dCByLKApITsoQ/t3nYWSOfBkxxfJDlLiW4hg5PVwMLM5lwODeFvY2QC0kC9zy
         a4pM94Zq1GDkqdFIKPc4HF7UIWkMCNQQOQP6xZJy8daZn7D97feKK9Ns1JjFi8EbOhPd
         InjTmXmCFyio5Ia5zHM+7iIts0XSpBu5Wv9qvJdYfaV7xKSToLhSA0AHbuSdDo7Dek4E
         0DVL/mqUiVCA2JqmBNi2l7OWFtDL2vx6rMuP6j8F1Pp3nGNXhZI2mqCV6GrcA4mrW3J+
         zN5bRRawax1eIHd2TetARGs/knvo1GpADNEbfoudHK13yzeqgvujD5fFQBxaJc5hcrKu
         OekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630158; x=1785234958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6gkln8TC+X7dROBQSudVEuyKf8Opd2LeVjHp6RExug=;
        b=X9l5F5CFlJpX14pCfKfLntDzOLdPrmTArsbqIPPht6Frwpnkzz67eLPpmnprhsjs2E
         HEo4v1YnU2w2xnYVgbkbMAw9qMFS8FVfB7dqc/b9tHg2HrZ0ssqz2VOvdFBy+8AuupAU
         n+88tB0keUu5MRJanwYSPtey298xlEoZ5GfrOON/m605AwwU/Ej5VlRynvOCu14uLDQd
         /X9vy8ItmIFifbZsoEblXR/RUGQoY+hrtfK1h/sZQTU/59Ftlp7EH+cc3oDFxlk09wsS
         IiYcNvOUzi/UanC72zh1yOFiTuUPWwVBQQ7rUObzU4sNRlX5XacAgYj9RJiXs5UVUsvd
         DoQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4OEsaVZwONVzwaCvwp7dd5erovGwDrHaQXeieTNQHSpycMFovsPTCDHqhvQQidXjMNGiBy3K11uBzEgGFRrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTc27yk239wAt9lPqzH75ieRFY24xr/pMo2+usCVXiSqZVnxyH
	8OgkXOwUesMldGJOnQE3/RigKNiZbObwwQVm7H4n5PKECFcJ4HffPRQH4UszJ37FunxmMmtzlNN
	0hx+fGH+ENzfPQh7Z+CMJo1wIt7iMc+s=
X-Gm-Gg: AR+sD13n820/QQwmc5X24nkzEO6RCVOdJK7qXwAQnFlLYrf3Ew8dl80atx0mg93qNhH
	tKgs5YNlA4vZmDAtTKv0TvHvxqXM/tWZrKX013VlTfGq+WKjEExmmEaOsDNhDOAix9dKmv8fzoj
	lIz4g1W22AXslPlxm3nkphxKdlsyp0B3EQiJK2erafV3QAytyIq9bQ0DF00ZDkF9tMZhmu+LS5I
	mePBwACwH2tjk6CJRI6GRvsLZtyzH9cBj1NLkGjNDaYUQYm9ELI9H6qm3ZasuvXGRpAvBBZRg==
X-Received: by 2002:a05:6402:50c8:b0:698:bdeb:a9ce with SMTP id
 4fb4d7f45d1cf-69e652726ffmr6135346a12.13.1784630158075; Tue, 21 Jul 2026
 03:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-3-luis@igalia.com>
In-Reply-To: <20260708131122.2917-3-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:35:46 +0200
X-Gm-Features: AUfX_myDrhpG_I_jw7T0ARJbDXZ0WGU31MEHieyc08zEfODDtXT-duqal-shoGs
Message-ID: <CAOQ4uxiy3X7ZZ_E_jC8Gqa6S==jb-m4CZh8kwmAznUWxeSQB=w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/5] selftests/filesystems: convert fusectl test to fuse3
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 3:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wro=
te:
>
> Since it is probably not worth adding new fuse kselftests based on fuse2,
> it is a good idea to convert the single existing test to fuse3.  The
> conversion is trivial, as it only requires some changes to function
> signatures (the gettattr and truncate fuse operations), and to the filler=
()
> helper.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  .../testing/selftests/filesystems/fuse/Makefile |  8 ++++----
>  .../selftests/filesystems/fuse/fuse_mnt.c       | 17 ++++++++++-------
>  2 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 612aad69a93a..422cd1b1688d 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -7,14 +7,14 @@ TEST_GEN_FILES :=3D fuse_mnt
>
>  include ../../lib.mk
>
> -VAR_CFLAGS :=3D $(shell pkg-config fuse --cflags 2>/dev/null)
> +VAR_CFLAGS :=3D $(shell pkg-config fuse3 --cflags 2>/dev/null)
>  ifeq ($(VAR_CFLAGS),)
> -VAR_CFLAGS :=3D -D_FILE_OFFSET_BITS=3D64 -I/usr/include/fuse
> +VAR_CFLAGS :=3D -D_FILE_OFFSET_BITS=3D64 -I/usr/include/fuse3
>  endif
>
> -VAR_LDLIBS :=3D $(shell pkg-config fuse --libs 2>/dev/null)
> +VAR_LDLIBS :=3D $(shell pkg-config fuse3 --libs 2>/dev/null)
>  ifeq ($(VAR_LDLIBS),)
> -VAR_LDLIBS :=3D -lfuse -pthread
> +VAR_LDLIBS :=3D -lfuse3 -pthread
>  endif
>
>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_mnt.c b/tools/=
testing/selftests/filesystems/fuse/fuse_mnt.c
> index d12b17f30fad..5d335fa5cf05 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_mnt.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_mnt.c
> @@ -4,7 +4,7 @@
>   * Creates a simple FUSE filesystem with a single read-write file (/test=
)
>   */
>
> -#define FUSE_USE_VERSION 26
> +#define FUSE_USE_VERSION 31
>
>  #include <fuse.h>
>  #include <stdio.h>
> @@ -20,7 +20,8 @@ static char *content;
>  static size_t content_size =3D 0;
>  static const char test_path[] =3D "/test";
>
> -static int test_getattr(const char *path, struct stat *st)
> +static int test_getattr(const char *path, struct stat *st,
> +                       struct fuse_file_info *fi)
>  {
>         memset(st, 0, sizeof(*st));
>
> @@ -41,14 +42,15 @@ static int test_getattr(const char *path, struct stat=
 *st)
>  }
>
>  static int test_readdir(const char *path, void *buf, fuse_fill_dir_t fil=
ler,
> -                       off_t offset, struct fuse_file_info *fi)
> +                       off_t offset, struct fuse_file_info *fi,
> +                       enum fuse_readdir_flags flags)
>  {
>         if (strcmp(path, "/"))
>                 return -ENOENT;
>
> -       filler(buf, ".", NULL, 0);
> -       filler(buf, "..", NULL, 0);
> -       filler(buf, test_path + 1, NULL, 0);
> +       filler(buf, ".", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
> +       filler(buf, "..", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
> +       filler(buf, test_path + 1, NULL, 0, FUSE_FILL_DIR_DEFAULTS);
>
>         return 0;
>  }
> @@ -107,7 +109,8 @@ static int test_write(const char *path, const char *b=
uf, size_t size,
>         return size;
>  }
>
> -static int test_truncate(const char *path, off_t size)
> +static int test_truncate(const char *path, off_t size,
> +                        struct fuse_file_info *fi)
>  {
>         if (strcmp(path, test_path) !=3D 0)
>                 return -ENOENT;
>
