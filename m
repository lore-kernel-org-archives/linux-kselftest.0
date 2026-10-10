Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57935A952
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 02:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600781; cv=none; b=S2U9qsddHiW6PlppUFqTVNaBIqZfFy/zYD3NuR3LnZXY6ZcrHwi1OHz7WbK0EGJUpbTdY6ugSan1D2uXxMCYv/yL0HUDoMNgB9n5VQJMZ11wH3RS0277q5WFBnKVVKarT9xP6D1bZ2oaWdWQD90twzs3H7SZcoi93byDUSSwYCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600781; c=relaxed/simple;
	bh=4Qs8lgaSJwPhckGmxqTCEHOFQ/iOtEbQyOhqJpHAVEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jz8nQZSDIH6MpsHy8LjK2a8DFrXXyLe1qUbeI/hWV1kLiFVH6W9pD2VxlNrPvZ8nXLclbpWl2LpSE/uxuN/EqKKeG6gnJ9HOfadkh+9mKyJg9/989q5+kN1TcBlCxpZYUj6HtKH4vNDyi4VZcc29WfdcIoBBkU3Ekaspp+Y8BeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H93zw6gq; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H93zw6gq"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-141395927feso492259c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 19:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600779; x=1792205579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Qs8lgaSJwPhckGmxqTCEHOFQ/iOtEbQyOhqJpHAVEM=;
        b=H93zw6gqcTT/rOMShwVjoqTE3Cmrj4P62YIoApQbQ450rqRg7nWIrWf7JUoBFL4YPL
         VVeVNsAr3blxFppPR2Sl/ti23sRkOGxl7vuUhIW9/sbECXdPUyrXHQaQXZzPKmQSwgb0
         ciaZbABZTKcMMFwTjnmsb+K8gMgWPUzJFemfKtwHhzX3HChgx+ilQS2QiZ7vgGvfL5KC
         IMmCbYLI+iIjNPnqO3D+o6d9bhZGG3wrBQ5j+BD1Rs9jDb83rwJLi40GeFUmwJTzHELE
         KFL44rTXapsMZK5S2Bb6txkdEcLTmj70Mq7Fh1PFe5hQpv7sOOcqrs/7V27tMcqomSJI
         TqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600779; x=1792205579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Qs8lgaSJwPhckGmxqTCEHOFQ/iOtEbQyOhqJpHAVEM=;
        b=k2iw/xa7qgOdr5Kmo3UrHHjBLs4sCuoDqtJzA/hAWOEu3UGxVbLQqTSnfiJ3/cOYd7
         9VQ4x1IPAOEcpIeLO8EPZ2F+I2H6G788WsIQKSzKpfT4ibxMyLb923to2v4xDGJSFhh+
         pQnopj6P3hJdq4l55IWgG1ZF6IGasOlOa9TIKADUwxj+cwWFjh3CRI7QSVXUCArHEztv
         v4NxTxjMyLVir3f4CSSnZTAY/1MPV5R53Y+uZA3LC6Ywa5sRS7I7ym0dnIccyT9+NjIA
         08mZK1bengsnkrXOxHrO1OOhXNkKm71wlUYdqYTe+QOTYgeY1QV/Uk3Y2upSn+nbhPPF
         r5Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzsbBUUmr8oQFWQ7hnkleHqHYJzY/cJHNgzm8Bq5UQOGXmDsv1sesJVFeQgukWD3I6/0fJWJek/T/ojv+AFsTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWvZTD3fWeIokGHDWToIGtuj+SH4cX4gBi+PoEiTsX5vJaBS9B
	AHvvHOrOl6IsG9qp8uCxL5LcofZiqHi1VHJ2OyHx2/f0KYyvaQ6WXn26
X-Gm-Gg: AYBFou12VA4+hmoLmJ1LANZkgrDtLbKC5l5ha6PslmNTbFeBEptehYfyov3uGwjblbq
	xQuaLge4HwIa8hysZtwstMfOpue8+imIiKtoKSoPJBo4F4A+HKWvnJrFTAGtd9FoTEkWUIFiww/
	Yn+a2r3K7ceiqf2PFCTB21aHUwBpmgVQc7SQmhmgIYjT1JZ2LSILgBI0o/R/jbLp9/JBL+ZJbuc
	w7OSIoTq6TdeyAehE3teCKTpCznoH6ca8Cdk2YAwpZQsCxfcqMF4q1tfLgo67ZL5Mvm3aQtizpa
	QEZXJ1RYvshzEKgICea3bdbx/f/8zOpeaRoJWnCx8E09iNrBcbf/ik0/RfkQgRc32s+XRYiEH/D
	Qqag3JIiXWmZ69HTOvNSiiHZ/rf7tprDkWqP9rbc+beuye304hHAGUedbnN5pTBOdRalOlfqtHr
	CHbUNH3T9NWtBXrvKNkSX1y9kDQ87A0RN7lFb7+rUUepIkAVadYtC4d2876OCXTQ==
X-Received: by 2002:a05:7022:3f0c:b0:168:3243:c91a with SMTP id a92af1059eb24-16a5dbfde08mr4952922c88.13.1791600779010;
        Fri, 09 Oct 2026 19:52:59 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm8975712c88.19.2026.10.09.19.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:52:58 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Accept unnamed dma-bufs in the dmabuf_iter default test
Date: Sat, 10 Oct 2026 10:52:52 +0800
Message-ID: <20261010025252.3716641-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CABdmKX2VHqWrPb2O3Uqdccx=nP66gECU0kVc=4tZdGqSEZvuGQ@mail.gmail.com>
References: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com> <CABdmKX2VHqWrPb2O3Uqdccx=nP66gECU0kVc=4tZdGqSEZvuGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Oct 9, 2026 at 5:07 PM T.J. Mercier <tjmercier@google.com> wrote:
> Hi Qiliang, are you running this locally instead of with:
> tools/testing/selftests/bpf/vmtest.sh -- ./test_progs?

Yes, I ran ./test_progs directly in a Debian testing VM, not through
vmtest.sh. The VM runs a GNOME desktop on virtio-gpu, and gnome-shell,
mutter-x11-frames and ibus-x11 each hold a 4 KiB udmabuf without a name
(their fdinfo shows exp_name udmabuf and no name line). As the
iterator walks every dma-buf in the system, default_iter fails on such
a machine before it gets to the two buffers it created. The minimal VM
of vmtest.sh has no such buffers, so it doesn't show up there.

The subtest only checks its own two buffers, so skipping over the name
of any other buffer seemed safer than relying on all of them having
one.

Thanks,
Qiliang
