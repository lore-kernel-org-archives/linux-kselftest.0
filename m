Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635520;
	b=ObsA1ylubYe68xySV2jaYR8VP5g6m+3AbJ9r60IErL5yaUVxInAJ3fyDnrGYVXKkeXJx
	 IsVI5CdaLeC1Yx/+DS5egEHdHnOfwkutyBzq/1Hshgmctm6tfhGumum9FEOwMy9gpAvgL
	 Pv7lrUOnynnj8EAyDLc3rHU9vAjEF8TAw5s2FLmXAeEu9n6NsOv2h6v/SNDXSnxDUjhIZ
	 uI+35Wam7Afnvw+2Z7QvoTT+u8sn+nmPe7AxAC2MgLHE88DmYzC4ZHKlwM91QC2KqpVuR
	 1eNK/wgNxHMe2Z1zkXU4jgozsf5P/n3ofOxNBHjQn2nnB9vwBoabPO7gMRUIJy2VHog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
	b=p+ZbxqYT2drNQj4yrPHEavcM9IPgUE9WcdkEY2tqByUYKESKhX64aeHizF/3uvj8StKP
	 yFFdJ8c8fJY4kjAOItvUYTI3+6Fmsvm3WIPXC701PPtrvZC+5mRq+nwNEAdQmQBrg9/lA
	 ieXR0WuNdMCfpUXLVhHaIzPOjQ1w4jp38RgiCmsRVu038CcNXdyYXnUULa6fUsAn3YazC
	 7IIjk+IPmJh+TYPFfKA5PopSrYZgg8Q7nIGbxpoXUv46JgLA/mKpy9vOjG9cXK+tXPHTK
	 oIaKnHSFc7n9Mq9n0jRRTbpEk5/xsgWuGI5L2XM8ONBuhqTMGNWq8OKE3OkHgORC6kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H+eszt1v;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E7606A31F
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 02:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47E7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H+eszt1v
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so3733932eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 19:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635519; x=1793240319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
        b=H+eszt1vKQtCU3/KB7Qzaij69qenfu0lG2XuIF4ZWISg5dYrkmC9asbrjtgR4CXkce
         TBXb4GKHG/wsSGQ+UrZ8+zEcA1NQgtYK91w+B80ULkg3ASikYfCo9UWfYmfwpvEte4XE
         jTTxbKPQVXpeU8ktIhq/YTivJtLdLSAXqmVf38FDGxukqYkaW7iUTpvQyxAALnq6XXGD
         ci38T/qydDnsRZLVQQuKo0hUWVY5R+df+t/heaKrcLMGs9Hz98Sz5r75F5L7LBqWlFQI
         egjfA+nNUHRlxwEXpwXcYyyWcLr+UjLA/NnupQKuiAMqRo8yIe4c9Dms37/DiCtx6ifF
         hfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635519; x=1793240319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVLKVn5aYrORuK3mJHdyAM2K05yQ1I4f1Gd2eeFrBFc=;
        b=L7x6MJtAkaB+lodxBG9k+5cuhx8S6wP+OHfmSG7omu34bPzPdFgsx1118tLlRAms4H
         pkdb7gxMgEZecHrNVo/DvzcsLzr8JNjklb1R10JenSDn6tGb9a1IG+HR5nIBSMO2WoK8
         ZPKvGZme4uQCp3DFhCoiZ4Zj8XrjIiiZu9Np2+I+/e9g08Sh/b7y+ALy4LCMzbrqr2/S
         JiEBfWajmpPvzjCnhArqFNX5jXQZEQqz18+jnkoQhviL+Wy0tzFxdSEade5VQg2rPoeP
         PACCD9JKJA69eiGaTeUC2+FBCn1b0X4hVzLNX/RoM5ctDYHHTIl/wGUxulu8rz6lSZMB
         YH+w==
X-Forwarded-Encrypted: i=1; AKwUvBzoU9EwjtogfWXBgXH4v49+64rTvjtHMXRmFGZ0c0YwI/C2/uaeOi8Tau4wIYrdh8ndjIB2hU/33dVIjqPS9MQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlq0C31CBy/JVpiGIlSZrcoUd5ICoJBS10+pAEbzyEw0e3NS95
	MMFtmJU0F+7aBWHvrhKWOiwFYWQ0x8ltOv5qQcnOvPwKrE+1oRGkR0nK
X-Gm-Gg: AYBFou2b8Nolvl2s8m09DDq7PteP1R2bxykau5tw1Q00yb4/KsBnH/FOF58FzvWlpvf
	GqK2deRbLpWnpIq9RCYQZBIfNU7C690XTlw1KhOVq+5SFC/spR2TrM1UCkwk1DhzXsriI6782gs
	91ORibpF6Sl8sEaHo+Q4YaLUm0/Iv0eFPzL37RCVRbcZ0RXq42PnPUcK71CF39F1ftTmhtSaBCy
	oROqEj3/K7FOuQjvIK86fm1bOwA+gemNXZSrQVBooozxI/YTBY+rPSdK3klVaesBC+fMWRowdGO
	DGt+OzAljeR3NTEmpdbtK3feCFOyw9+grGnXRfypA90zToWKQArkfACLfRwfKc/nzTTegrz8O9n
	1DWIOre2EjSSW5zoLnLiUoNqiA22dOUG0CSg4LbM/IMoYaqZG6eocbDLuSjrxqOos4MY7DJ1Oq2
	yyTFV52zL5gU69fHl+5c+Mg1A1WAMgsf3Kc4G4cy1azQGFc0xGA2LFCLE6e/3LBbWb/ojl6gIgE
	eo64Cum2Dq+UjrxGm7/RLXGsqNwcA4Jzwx8ZX709TY5s4o=
X-Received: by 2002:a05:7301:618e:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3674c63d579mr5523810eec.10.1792635518735;
        Wed, 21 Oct 2026 19:18:38 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368b4b8e9c6sm3556805eec.1.2026.10.21.19.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:18:38 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
Date: Thu, 22 Oct 2026 10:18:20 +0800
Message-ID: <20261022021820.1789083-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com> <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com> <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 12:58:54 -0400, Andrey Ryabinin wrote:
>> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
>
> Why it's open-coded ?

For the same reason as read_word_at_a_time(): commit ece69af2ede1
("rwonce: handle KCSAN like KASAN in read_word_at_a_time()") open-coded
it "to avoid having to pull the entire instrumented.h header into
rwonce.h". I kept the six asm/word-at-a-time.h headers to the same two
small headers, kasan-checks.h and kcsan-checks.h, rather than pulling in
instrumented.h with linux/bug.h and kmsan-checks.h.

Thanks,
Qiliang
