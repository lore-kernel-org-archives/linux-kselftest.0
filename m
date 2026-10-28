Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224972;
	b=kNNSEpCQMH626xJVAHfgtoe43jWhNLSD2xruJiSkJy5TMP5EUpYXjaPUMnuvIcAXD8I0
	 e0yuJ8bwgq887FK2HyIoq4sDgidYY4MMhggPcVpjcRTaT3K598qr8F72NvB3BPQuMJJe8
	 0pyodOSb6Kvg6WM4M/wx4ypSpVD8Ro2CIJR6TdX3C4Ihiw5jzBhZfMYppNZWK/gjrFPAb
	 Hu8zkbBV7c7xr38do922QSu7glpfUm3zv5uReTe511/LxbseKeqAI7AgU3+diS5O8Yig2
	 B5S5cmgDuw84NVK6jjT2ZANSltoaykmBX01lCGxr5Gh31dg0neXEGe9bMAue8IjJo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GcrlTSCULdvhrUkPvOAFhOTgnCx2Xeq+skZ+Lyakb9A=;
	b=2fEHnf81CzUs3mxoX40yMSG3SO5L4xb0gVgcVa88ovuDI3qoxEVw6kW896C50Ajuzof9
	 vw2oSz/l/Y2yBgrL97lstm2Pog9IUvLrZllBrMuSk7q+nWnJRvOSnwoTdiVHVywvXdHdD
	 q/9y5AGhkjk06R9qsTU+G6g/OxMtBjz4A+4osgcHJGMirEDqEw3FlBhGEVZF4OiyTsixm
	 o7jKtwlIb7B7Y9Jwuy3vp7gx0bfNDcNO/NtQc5smjmCl7X5+2ZHoKFvPwC67i5jPYLZhK
	 5gc7UZQ52J806x+bJq+PscMn1ZSc9dbdb6vT5d2MZCn0rE5jWESJ2RArsAlLsAR2A5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OJYYelLK;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F6E606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 22:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OJYYelLK
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so1337314e0c.2
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793224970; x=1793829770; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GcrlTSCULdvhrUkPvOAFhOTgnCx2Xeq+skZ+Lyakb9A=;
        b=OJYYelLK1iGMMCvcQfBuaIV/Yjzi0Dl7jficiYkSauMn5Nk1s6d/mr8bEuISK01u/A
         qg6urmTUQtzZPnZojdQmN+ftrOVB6EF4xMfajB0fmd/uD8RiUwGHYqLIWMSydovmTwEp
         +Q/S0EdwX/PlhcG6mgigk7zM56rNALLMsHJRFMjWgG/YG9np//ECc8zTMh6opSahajBG
         M2XHaxWwoOSe95+JtVNjfH007Y0Im/zKXm7qxqkOsGNqGLMPYFlrSeu3wGZnNr2A1TEi
         QlBI9a9lvLh6jbCvgxkBXstHZ5HdZBS7e83te5CR+dvFiXHjARHoQQgTgO4m4UjrO5mk
         kjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224970; x=1793829770;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcrlTSCULdvhrUkPvOAFhOTgnCx2Xeq+skZ+Lyakb9A=;
        b=hNtEX+fOvU1U437rFv8S982UhCXSCF6tY5EmYqcGHCGkHhEjU3rfVSBDWp8VXUdBg3
         l5HubAMh3mR1cPuLMObkLt1EHohh0LxatYl1MpxzG/xL0OHnjFZmJMnfEliYO5TLtGO0
         DwUucNeZtPHNvIJbuPQOs8tKy2D8dZbv7gOguuXndKExqwws74ZRBuXmqE0CTrpIBHcQ
         D5wUihCdPLn4Dwdy8No4nUfZtv3WoG1ZOINryJmsT+puVetOJwXWN/hTjxmbBVSkqcDl
         btnWSPQ7RSxgdcURqbIg/Ft0IydnYrct/K5Zl8ZRya0kZFAbFUho6oSTmZ27bCK6ZuWX
         RkKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcxGtcX5AFt0cUB8jLomNsg2lO3uZEkGnlGWkemEgDga2VhCJ0JMtrhaJgSdWTm4ZsmFBrV+QxrWLYeNIGyaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPCnMGJXxFlX14lEACKliBQvtKqEvJ+NuF6iOHq8vcJFRqBaLw
	hMzvbpSdQpO+K55Yvt28xriXXU0dCyeY7WMZPfbr3fhXuQNLJp32W10Q6v/1bgsh1sc=
X-Gm-Gg: AYBFou0d6HDTwJHAnDgdMu9gAX3wl/ZCVEfPpAdxWuf+2f1Q/559NOTBPlfCJusDME5
	u1XQyAnbgWf/pU1r00kioiHDHz/PByTYbTKpjlbpXc+iwhM60+4oOO8Hx4PR0qp03SOlRkkSRrp
	SIgjuSbaAeLZmn6mC0amXu64uxEZFk+q1n36Iy3/RIdXPoyxo3RaucinvzZU7EYjUkJ3mW1ogmp
	gp+vNvlXvV76JfppGcbEmJeGdDcq8+uD2mIVx5iGKgxHwLP5bp6+KbmQEQZSMV4lMW54/u/fhKH
	t2MGsWaw2IXY3oRrsVlydiYEr8yXQ6o2Hn86q5huUNH1gaP5ul8yndIErPNKPfPKlsaIiFkOZve
	YMArb7JmmZZ9EwYzTe1n/WdyTjBsjFrnitTV2H9TjrDoxpXRjJd3EE8eTPSWbE5STtPofRK2W2T
	hl24pq1qxGbKwAHc9P8Br0TcM58yujI03e2kRg3jqyPys5ngeu7v7OeOje30ONY1BMZB+uhpqRb
	VsVnzhjIfepxjCHb6MyieGxhyQtDd/1AsnOscnfBSpyAbs4N7Wv89WQ6YgH3T5Gm03znapnh3Rf
	uBmPigA5883AuxkZFv0L70R8LNmHARJEaCY03PKPSbaUlldvBDvRyIUX3FK+HO4fkHd4TlhtQG5
	IaI4jPDFMfuk1GllU4m2UTBytKM0U2qKaeq2INQt2U+cg
X-Received: by 2002:a05:6102:3eca:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d03a66da9dmr1683821137.36.1793224970093;
        Wed, 28 Oct 2026 15:02:50 -0700 (PDT)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9912dad26fcsm4837237241.11.2026.10.28.15.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:02:49 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a
 tmpfs mount chosen by userspace
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261022225035.377445-8-dmatlack@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-8-dmatlack@google.com>
Date: Wed, 28 Oct 2026 18:02:45 -0400
Message-Id: <179322496574.1894369.544573858973645958.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14608;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=FI8Cbq/EUksn+UGQql9laZNxBy24mVhpSXErkKywoD8=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq4nEI+PlHSI4mk7Ces6sCfKC/790Y0VsKBAORM
 pyUUdp9GrSJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauJxCAAKCRC7dyhM23N6
 3lb+D/9u6A/NQV4P9T3JjOuluXAIXM7Z04GRzTR8QhSQbgHmqkbjLR5QQfrzJghpCxmnYDj0yRB
 x4XgYPsOEPAfwwCKlhPlgJ4al1tiLVO1vYJbSDYBSL5rE5htgOXRn0aP6u7av7vgvGi2ws3K566
 cIDN2IfonQvAFoytaGF8VmpxE/wg7VAiNGZfr68hQyg39aocNoqxpmbqTK4i672ywldx+9i1mqG
 CfGRZammvOms1rGpGHSp/nGzVZe1EioWwVAYx5QjlZQy5gKlo0DufadpCQdzCa7zn1+L2hkAuKU
 CuchnpqcaPokmtTQ+aShKvhqsJ77TZfSOT9iFbn6oTjwyT0KjJqNKvB6HHFcKp3BUkke6LBsuIW
 KytYaN4HbZJddbN+bgSygdtD8MjAzrNYE+5pkznvbNaJKUPR09T9dhVHtOhgHk7HUjTbcliI0Wv
 6/jr/KWWxBV3OoL9EnEtgi9Iyn7AbR4LuC8ypMMp49CkIKsQtNr7pv5Q6PHitX0K4xTEwTMpzHP
 77yt8qV5i+iv0JzFC/+ld1rKWFNSi2OPfniKNo2qGoyOrJFTq23ViznDD9n66PxHQSu6jywjBmy
 uqEL66CFKCM+yKefO3PwaKI8bNhulw+YAWe+LEhI/LtljRZUPB2CC7ebPrIrlVns+76pTiKlQDt
 VKotPHrha+rrKoA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Retrieve files that were preserved from a tmpfs mount onto a tmpfs mount
> chosen by userspace, instead of as memfds on the internal tmpfs mount.
> Record which mount a file was on with a new SHMEM_LUO_FLAG_TMPFS flag in
> struct shmem_luo_ser, based on the superblock of the file. shmem_luo
> already accepts unlinked tmpfs files, such as files created with
> O_TMPFILE, and a following commit also accepts linked ones.
> 
> The mount a tmpfs file was on doesn't exist in the new kernel, and
> userspace may want to put the file elsewhere anyway. So add struct
> liveupdate_shmem_retrieve_arg, which userspace passes as the retrieve
> argument of LIVEUPDATE_SESSION_RETRIEVE_FD. It is modeled on open(): The
> kernel creates a new file as if by openat(dirfd, ".", O_TMPFILE | flags,
> mode), so the file gets the owner, permission checks and security labels
> of any new file in that directory, and is charged to that mount. The
> kernel then fills the file with the preserved contents, size, position
> and seals before returning it, so nothing else can access the file
> before it is complete. Userspace links the file at the path it wants
> with linkat(), or passes O_EXCL to keep it unlinked. Neither the path
> nor any other inode attribute of the file is part of the preserved
> state, which keeps them out of the KHO ABI.
> 
> Pass the flags from userspace to file_open_root(), so that the VFS
> checks them like for open(). file_open_root() silently ignores unknown
> flags and mode bits, so reject those like openat2() does. Also reject
> O_PATH, with which file_open_root() would ignore O_TMPFILE and open the
> directory.
> 
> Keep the type of the file: memfds can only be retrieved as memfds, and
> files on tmpfs mounts only onto tmpfs mounts, so that e.g. a file
> can't be moved off the mount whose size limit and quotas it was subject
> to. Passing the argument when retrieving a memfd, or not passing it when
> retrieving a file from a tmpfs mount, fails with -EINVAL. Unlinked tmpfs
> files were retrieved as memfds until now, but nothing relies on that, as
> the LUO uAPI is not stable yet.
> 
> Like the other failures before the folios are restored, problems with
> the argument and with creating the file can be retried.
> 
> Assisted-by: LLM
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261022225035.377445-8-dmatlack@google.com
>
> diff --git a/Documentation/mm/shmem_preservation.rst b/Documentation/mm/shmem_preservation.rst
> index e79bf8afaa9e..030a8f18680c 100644
> --- a/Documentation/mm/shmem_preservation.rst
> +++ b/Documentation/mm/shmem_preservation.rst
> @@ -1,11 +1,11 @@
>  .. SPDX-License-Identifier: GPL-2.0-or-later
>  
> -==========================
> -Memfd Preservation via LUO
> -==========================
> +====================================
> +Memfd and Tmpfs Preservation via LUO
> +====================================
>  
>  .. kernel-doc:: mm/shmem_luo.c
> -   :doc: Memfd Preservation via LUO
> +   :doc: Memfd and Tmpfs Preservation via LUO
>  
>  Memfd Preservation ABI
>  ======================
> diff --git a/include/linux/kho/abi/shmem.h b/include/linux/kho/abi/shmem.h
> index b61687e358a2..88ef7d49b5f3 100644
> --- a/include/linux/kho/abi/shmem.h
> +++ b/include/linux/kho/abi/shmem.h
> @@ -18,8 +18,8 @@
>   * DOC: shmem Live Update ABI
>   *
>   * The shmem file handler, which preserves memfds created without
> - * ``MFD_HUGETLB``, uses the ABI defined below for preserving their state across
> - * a kexec reboot using the LUO.
> + * ``MFD_HUGETLB`` and tmpfs files, uses the ABI defined below for preserving
> + * their state across a kexec reboot using the LUO.
>   *
>   * The state is serialized into a packed structure `struct shmem_luo_ser`
>   * which is handed over to the next kernel via the KHO mechanism.
> @@ -69,12 +69,25 @@ struct shmem_luo_folio_ser {
>  			     F_SEAL_EXEC)
>  
>  /**
> - * struct shmem_luo_ser - Main serialization structure for a memfd.
> + * SHMEM_LUO_FLAG_TMPFS - The file was on a tmpfs mount.
> + *
> + * Set for files that were not on the internal shmem mount that memfds are
> + * created on. Such a file is retrieved onto a tmpfs mount chosen by userspace,
> + * instead of as a memfd.
> + */
> +#define SHMEM_LUO_FLAG_TMPFS		BIT(0)
> +
> +/* The set of flags this version supports. */
> +#define SHMEM_LUO_ALL_FLAGS		SHMEM_LUO_FLAG_TMPFS
> +
> +/**
> + * struct shmem_luo_ser - Main serialization structure for a memfd or tmpfs file.
>   * @pos:       The file's current position (f_pos).
>   * @size:      The total size of the file in bytes (i_size).
>   * @seals:     The seals present on the memfd. The seals are uABI so it is safe
>   *             to directly use them in the ABI.
> - * @flags:     Flags for the file. Unused flag bits must be set to 0.
> + * @flags:     Flags for the file (SHMEM_LUO_FLAG_*). Unused flag bits must be
> + *             set to 0.
>   * @nr_folios: Number of folios in the folios array.
>   * @folios:    KHO vmalloc descriptor pointing to the array of
>   *             struct shmem_luo_folio_ser.
> diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
> index 953ffe0823be..a9dcc4fcc87b 100644
> --- a/include/uapi/linux/liveupdate.h
> +++ b/include/uapi/linux/liveupdate.h
> @@ -247,4 +247,39 @@ struct liveupdate_session_get_name {
>  #define LIVEUPDATE_SESSION_GET_NAME					\
>  	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_GET_NAME)
>  
> +/**
> + * struct liveupdate_shmem_retrieve_arg - Argument to retrieve a tmpfs file
> + * @size:  Input; sizeof(struct liveupdate_shmem_retrieve_arg)
> + * @dirfd: Input; A file descriptor for a directory on the tmpfs mount to create
> + *         the file on.
> + * @flags: Input; The flags of the file, like the flags argument of open(),
> + *         except for O_TMPFILE, which is implied, and O_PATH, which is not
> + *         allowed.
> + * @mode:  Input; The mode of the file, like the mode argument of open().
> + *
> + * Passed via &struct liveupdate_session_retrieve_fd.arg to retrieve a file that
> + * was preserved from a tmpfs mount. Such files can only be retrieved with this
> + * argument, and memfds, i.e. files that were preserved from the kernel's
> + * internal shmem mount, can only be retrieved without it. Otherwise, the
> + * retrieve fails with -EINVAL.
> + *
> + * The kernel creates a new file as if by openat(@dirfd, ".", O_TMPFILE |
> + * @flags, @mode), fills it with the preserved contents, and returns it in
> + * &struct liveupdate_session_retrieve_fd.fd. Like any O_TMPFILE file, the file
> + * is not linked into the filesystem. Userspace can link it with linkat(),
> + * unless @flags contains O_EXCL.
> + *
> + * If @flags contains unknown flags or O_PATH, if @mode contains unknown mode
> + * bits, or if @dirfd is not on a tmpfs mount, the retrieve fails with -EINVAL.
> + * If the file can't be created, the retrieve fails with the same errors as
> + * open(). A retrieve that fails before the preserved contents are restored can
> + * be retried.
> + */
> +struct liveupdate_shmem_retrieve_arg {
> +	__u32		size;
> +	__s32		dirfd;
> +	__aligned_u64	flags;
> +	__aligned_u64	mode;
> +};
> +
>  #endif /* _UAPI_LIVEUPDATE_H */
> diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
> index 9a1c49e2e0c4..61d01f5a336e 100644
> --- a/kernel/liveupdate/Kconfig
> +++ b/kernel/liveupdate/Kconfig
> @@ -70,14 +70,14 @@ config LIVEUPDATE
>  	  If unsure, say N.
>  
>  config LIVEUPDATE_SHMEM
> -	bool "Live update support for memfd"
> +	bool "Live update support for memfd and tmpfs files"
>  	depends on LIVEUPDATE
>  	depends on MEMFD_CREATE
>  	depends on SHMEM
>  	default LIVEUPDATE
>  	help
> -	  Enable live update support for memfd regions. This allows preserving
> -	  memfd-backed memory across kernel live updates.
> +	  Enable live update support for memfds and tmpfs files. This allows
> +	  preserving their contents across kernel live updates.
>  
>  	  This can be used to back VM memory with memfds, allowing the guest
>  	  memory to persist, or for other user workloads needing to preserve
> diff --git a/mm/internal.h b/mm/internal.h
> index 38b1165212c9..630ae0297dd5 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1436,6 +1436,7 @@ int shmem_add_to_page_cache(struct folio *folio,
>  			    pgoff_t index, void *expected, gfp_t gfp);
>  int shmem_inode_acct_blocks(struct inode *inode, long pages);
>  bool shmem_recalc_inode(struct inode *inode, long alloced, long swapped);
> +bool shmem_inode_on_internal_mount(const struct inode *inode);
>  
>  #ifdef CONFIG_SHRINKER_DEBUG
>  static inline __printf(2, 0) int shrinker_debugfs_name_alloc(
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 897fa2b61346..fe2be9300ae7 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -5860,6 +5860,15 @@ struct file *shmem_kernel_file_setup(const char *name, loff_t size,
>  }
>  EXPORT_SYMBOL_GPL(shmem_kernel_file_setup);
>  
> +/*
> + * Whether @inode is on the internal shmem mount, which is used by
> + * shmem_file_setup() and thus by memfd_create().
> + */
> +bool shmem_inode_on_internal_mount(const struct inode *inode)
> +{
> +	return inode->i_sb == shm_mnt->mnt_sb;
> +}

Please fix the warning reported by kernel test robot.

> +
>  /**
>   * shmem_file_setup - get an unlinked file living in tmpfs
>   * @name: name for dentry (to be seen in /proc/<pid>/maps)
> diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
> index bcac1bbb3db3..ecbeb37d33a8 100644
> --- a/mm/shmem_luo.c
> +++ b/mm/shmem_luo.c
> @@ -9,19 +9,20 @@
>   */
>  
>  /**
> - * DOC: Memfd Preservation via LUO
> + * DOC: Memfd and Tmpfs Preservation via LUO
>   *
>   * Overview
>   * ========
>   *
> - * Memory file descriptors (memfd) can be preserved over a kexec using the Live
> - * Update Orchestrator (LUO) file preservation. This allows userspace to
> - * transfer its memory contents to the next kernel after a kexec.
> + * Memory file descriptors (memfd) and tmpfs files can be preserved over a kexec
> + * using the Live Update Orchestrator (LUO) file preservation. This allows
> + * userspace to transfer its memory contents to the next kernel after a kexec.
>   *
>   * Here, a memfd is a memfd created without ``MFD_HUGETLB``, which is a shmem
> - * file on the kernel's internal shmem mount. Memfds created with
> - * ``MFD_HUGETLB`` are hugetlbfs files, which this file handler doesn't
> - * preserve. Preserving them fails with ``-ENOENT``.
> + * file on the kernel's internal shmem mount, and a tmpfs file is a file on any
> + * other tmpfs mount. Memfds created with ``MFD_HUGETLB`` and other files on
> + * hugetlbfs are not shmem files, and this file handler doesn't preserve them.
> + * Preserving them fails with ``-ENOENT``.
>   *
>   * The preservation is not intended to be transparent. Only select properties of
>   * the file are preserved. All others are reset to default. The preserved
> @@ -29,12 +30,13 @@
>   *
>   * .. note::
>   *    The LUO API is not stabilized yet, so the preserved properties of a memfd
> - *    are also not stable and are subject to backwards incompatible changes.
> + *    or tmpfs file are also not stable and are subject to backwards
> + *    incompatible changes.
>   *
>   * Preserved Properties
>   * ====================
>   *
> - * The following properties of the memfd are preserved across kexec:
> + * The following properties of the file are preserved across kexec:
>   *
>   * File Contents
>   *   All data stored in the file is preserved.
> @@ -49,10 +51,12 @@
>   *
>   * File Status Flags
>   *   memfds are always opened with ``O_RDWR`` and ``O_LARGEFILE``. This property
> - *   is maintained.
> + *   is maintained. The file status flags of tmpfs files are not preserved.
> + *   Userspace chooses the flags when retrieving them, as described in
> + *   "Retrieving Tmpfs Files" below.
>   *
>   * Seals
> - *   File seals set on the memfd are preserved and re-applied on restore.
> + *   The seals of the file are preserved and re-applied on restore.
>   *   Only seals known to this LUO version (see ``SHMEM_LUO_ALL_SEALS``) may
>   *   be present; preservation fails with ``-EOPNOTSUPP`` otherwise.
>   *
> @@ -67,12 +71,50 @@
>   *   A memfd can be created with the ``MFD_CLOEXEC`` flag that sets the
>   *   ``FD_CLOEXEC`` on the file. This flag is not preserved and must be set
>   *   again after restore via ``fcntl()``.
> + *
> + * Inode Attributes
> + *   The name, path, owner, mode, timestamps and extended attributes of the
> + *   file are not preserved.
> + *
> + * Retrieving Tmpfs Files
> + * ======================
> + *
> + * A tmpfs file can be retrieved onto any tmpfs mount that userspace chooses.
> + * The mount that the file was on doesn't exist in the new kernel, and userspace
> + * may want to put the file elsewhere anyway.
> + *
> + * To retrieve a tmpfs file, userspace passes a
> + * ``struct liveupdate_shmem_retrieve_arg`` to
> + * ``LIVEUPDATE_SESSION_RETRIEVE_FD``. The argument specifies a directory on the
> + * target mount, and the flags and mode of the new file. The kernel creates the
> + * file as if by ``openat(dirfd, ".", O_TMPFILE | flags, mode)``, so the file
> + * gets the same flags, owner, permission checks and security labels as any
> + * other new file in that directory. The kernel then fills the file with the
> + * preserved contents, size, position and seals before it returns the file, so
> + * nothing else can access the file before it is complete.

Looking at this together with Pratyush's mapping-freeze series ([PATCH 
0/3] mm: allow freezing mappings), I think we should extend the mapping 
freeze lifecycle from preserve() -> retrieve() to preserve() -> 
finish().

When retrieve() returns an fd, its mapping should still come out frozen 
and only become fully user-owned/mutable once a successful session 
finish() happens. That keeps the index -> folio mapping invariant across 
the entire live update until every fd in the session (e.g. vmfd, 
iommufd, vfiofd that depend on the memfd) has been retrieved, passed 
can_finish(), and been finalized together in finish().

(Doesn't have to block this series, we can do it on top or as part of 
Pratyush's AS_FROZEN series.), but I think we must fix it either here or 
there.)

-- 
Pasha

