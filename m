Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753033;
	b=kwP2oEw9pV5NV/feBuoPYnuovIWnSVD3lPpKsaUuFdf9ZdcP9eVdOuwzc5WDRC0Z7gvc
	 Nlz0HTfI+Mv+FhqvLk8jWl3uR5XjZfsviO3quL//hLMVgo0JoiGkR0ZjL1iN+oZNSopjS
	 bcR5Wgz2HMgGS3JrZpyRTq2fQaOQ7xn8cHEv0UX5IDqp4qMug3gW+6DGhFJlZlhHkmF1H
	 AKHOZ4Sav6TH9S3Nl+//ZBxP/krechJfaZTLMby5bLhIJvJshLRo1m5d9s9+2OASe/udH
	 SJDyeFXpu+WoWE0h1IF4RWrxrUC8eJ2ubKUuzjos9MFxnXW2qSGc28YGDIkfwcSPPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KRXI5AlbB9KpB+65wVIGCYZD4BhZazr9WIMOqzWe5bM=;
	b=KrNqyin0OPPyGeFiRhqIhwVpsNqNXWCaLUv9iALp9l6jKUPz0/YGz4dJ1BO4I638Ajil
	 bmfdkKN8oN7nOoV+8cyXI36HNcSzUOd7fq0FfHZDjRrY6yXBaAxzpoWSUbilN7XLwF66p
	 kUQvUOM43KOPT01a69UQTm2vtlLeklo8nKOv6CvTLjxkQgZeSPw8W9czKwHQDYwph8MtX
	 9Mq/rawvNTJ8ItUPv8uoF2TOUGaJRSDnQGQP/VzMlOtkJYpQZ/2D5n+YwrX1hL6NO7VkV
	 D404acNCskfhpVlfu0kO1HPeMbNTBi1Vobrp/px3WCQafHMJFS6gNHcENXH7tqg0E9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="byuKBb6/";
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87C4606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 00:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87C4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=byuKBb6/
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98301b325c4so47474241.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 16:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793753032; x=1794357832; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRXI5AlbB9KpB+65wVIGCYZD4BhZazr9WIMOqzWe5bM=;
        b=byuKBb6/8WaYdK9ZN5JosQguOh0zfqttOB9yRf0V4UuM1awfQ2TVzBP96+ASY1APxu
         qIXdn/+Ihqq3ANCZus/7buB+EvxOAxJafkes9lTBv8qjXlOXBS6R8wtL4p8emNJ07JRB
         yCIkOaT7t5KVyBqVJwgfL5ImUqDzfu4Ehf28G4leLzrbbQbd9mBIglO0OwL0+FVGXosV
         XKKBTNqN30hc6Mkenrapw3TRZnwIJkEtginPUKUoB02DNWsCmX3tOTBvlZCWvNkq3iYk
         ZYUxHQGR9NENxo0jOZmJ5x1dIxKdufKn/6LKvI7Qto4bzWHPCq72NVS0ytaf1nGsbX3+
         ov2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753032; x=1794357832;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRXI5AlbB9KpB+65wVIGCYZD4BhZazr9WIMOqzWe5bM=;
        b=S9CLk6ns9GuyRxis6t/HXLyO1tRaiM2+EXeQHnXgGwt2smmYWgkirG3z0SsEXmf6/T
         OCW4rz7t2MbrGM3B4/Mcy9xVA1eVpwhY6BJM+0/eY1Chu87YTRYAkrIYBGc0wRzju8Z8
         SzVi4TcnG32/3gZNkDsgLdyHiANAr38seAQQbcJWv/Uf7Hxl1e0bIcZ+HksO9wclHl2V
         1a3Scy+LwRl58BIe/KGp/AEtpVC8gTiZ32o5tzG9ZSdUyyC4CtFPRC7DsskHF5m3X7NL
         dk2OexuMkWgcXYZpkNnaoqCA/BjX5tZo/iLYWqVyrQNKZqdV0+iq9t6vXI3QInjObhxc
         UnHw==
X-Forwarded-Encrypted: i=1; AKwUvBz04lv7RdlGtRYSccuvACLrvIzz9EX5B2TxLNC7FXAPrrCZgm5KQWXLX83v0dtKh8Ij0J4pu7hBtgVnQNNJa0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lZdvJDFWiKvK6wBsrNB1m7ZqmgZtRc5yETnsF4l/AAZ/Sejvg
	etpZuAdlIOm9BRB2LJ8kkku2FrjI0SGAxaF8DvYDbbjUXw8Qot+oyfjwV1qijeI1s5wive0ab5M
	TCeQq
X-Gm-Gg: AYBFou2VGlMMTTxjfiPELgE/ZDkhdbBNKUFbzTlh3ZH9Jmk4bm11jPPVvVHlc01GHoY
	gTE4LnAKSVHto4uzjHD8jIEAWYhCn6m6umAgDhzVhD+agU1EHvPbRpTbnVuIKxSwAuFbdkBIHWA
	FxvbwIjtdebISI1g+1d25GQPa7Mjg4lo6Kk8Wa7vi5gT+NoYoh0KOZiOBdcY0rvl8jiAkqlftAy
	mgd/tI3Jt6uykkJNnduzszdvEkABeerOJ6MGiv9FqVo9QBxKZIdJVBPnF6Wh/YyCrn8iGNWJZue
	OpElXgXTs5pa0/EzrlM80mEsDP2UxrpQKq+GovGrGkH19npD97eZE9FKu5iEb7oet0F0/NJxDPf
	ODH+sY1rwkmyPeHKY6eJjTSf7pD++FV+2gZzZuipnq3MIKFk1cSKhUoHFkGYZc9UvprLHc7LOxs
	TDkEef7eeNm2taD/fouuz3K4eZ6a1q6RBw8jvgk+D0OvCITorwBiMI2ReIcOy3EyecrHnI5RcPZ
	iauRnv8Cd7SalUslODK8tH4y2rGMohl4+HXz9txcwLbe2jrfCp/Gs4xxn6Erf92dC7pK14JkZ2b
	dk38wTVr48kvFxSUh5tuzBqwPTzg48Rc/m9hnOjx+bnymW74bGD6lJj2/xk8q5b2/itDjQQlAQU
	PVyMejm+4kzfjoQQDqAC0zKjsCNRCjcGE8QLIc13+43w8
X-Received: by 2002:a05:6102:4a53:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d276b006bamr791137.9.1793753031752;
        Tue, 03 Nov 2026 16:43:51 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm527432137.11.2026.11.03.16.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:51 -0800 (PST)
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
Subject: Re: [PATCH v3 07/10] mm/shmem_luo: Retrieve tmpfs files onto a
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
In-Reply-To: <20261103010216.3447716-8-dmatlack@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-8-dmatlack@google.com>
Date: Tue, 03 Nov 2026 19:43:45 -0500
Message-Id: <179375302574.727293.14537040566857910268.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2542;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=vqAe2yDDLEwKgdF25FVv1O+wpJlIipaSEL5hDK2VqOY=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6n/ET4OO45vZ6StOR902DLzVLY6Bj7770P8sb
 nnjgwQuckuJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaup/xAAKCRC7dyhM23N6
 3jnJEAC0kky9VSu9xkI04nj8RiMbjwZNaipgbM8c84yf/wc4An6yU8htiqArYikDHsF3LbfOPIu
 ZJUI96h+M87DI496Gg92JK+uzFrY3uJjoyYr6us6+nUjcMcRYRWUS14WbhTxF7LoVgCU7SpDi1V
 MK7oieNjQXNfVgW/NL+Slwq5olNJUkvSgPFiAU8xQjVJxJHLYJmIJIXxc5vrbOVfL7YzAy7OxvD
 NuTg0ha8GM19+ZVxhZjYxkwGpmHD/eqTqJKoDVST6z17DZBoHHTbkpvXEHEsHmPCJhdTnBwejzX
 hbQEnk5/nzD5A3xC2edrsjyws0b8KclIaBJ4mNo4RtHUlelIO/ETzlvNcSmgpx/32KI74IwNr0z
 V4G6BxZrPeQ2TvjDEOTsCOP/lKsVlCx5YHTZYdhgmlBgR//QxXA76UCWPPpy0P1U4kNlZyNH6XV
 e3oMwZs1iPhhtd9+roQtAfbc6IPf+TbFCwI0KxQyxKaJvIxQQl98TA9L1QxJK3Eu32Hg8sqs8ED
 afWk9iPUD+ACfrf9HgHLFHlyw6RWtNm1UGEI9lvbzR1iPJesYxMSuVxfAANKfyZIR1g/hjH50H+
 OTddQgi8QtOA6wOiO+tOIvWJWdjD706Y4+8m7qxO6a0u8szavw1N/NXcclT2ViuQIaOrPcVya3z
 1YbZ7UGOm90VVsA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Retrieve files that were preserved from a tmpfs mount onto a tmpfs mount
> chosen by userspace, instead of as memfds on the internal tmpfs mount.
> Add struct liveupdate_shmem_retrieve_arg, which userspace passes as the
> retrieve argument of LIVEUPDATE_SESSION_RETRIEVE_FD to choose the mount.
> Record which mount a file was on with a new SHMEM_LUO_FLAG_TMPFS flag in
> struct shmem_luo_ser, based on the superblock of the file.
> 
> shmem_luo already accepts unlinked tmpfs files, such as files created
> with O_TMPFILE, and a following commit also accepts linked ones. The
> mount such a file was on doesn't exist in the new kernel, and userspace
> may want to put the file elsewhere anyway.
> 
> Model struct liveupdate_shmem_retrieve_arg on open(): The kernel creates
> a new file as if by openat(dirfd, ".", O_TMPFILE | flags, mode), so the
> file gets the owner, permission checks and security labels of any new
> file in that directory, and is charged to that mount. The kernel then
> fills the file with the preserved contents, size, position and seals
> before returning it, so nothing else can access the file before it is
> complete. Userspace links the file at the path it wants with linkat(),
> or passes O_EXCL to keep it unlinked. Neither the path nor any other
> inode attribute of the file is part of the preserved state, which keeps
> them out of the KHO ABI.
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
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261103010216.3447716-8-dmatlack@google.com

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

