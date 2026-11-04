Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823298;
	b=5XPwObjmhTx2M4LXGSBUeB3e4CBKbBMYu2iXNVUYj8Qz49qP03FS8nbqyqCmw+EeC8F5
	 SDMqjDGVU5EZnfE3zyojonFKSNkEyzPbvusT+Nw1CFU4thw9CkMF4T2W2bI8yvqawc0lc
	 tTux+C7bnxxAYa5uLU2ijCEgEdnbQaeCnACv3Ravbjv2Oy1DxYK9zqrbcroxnSk+fISwJ
	 YvfF3DNZoRmmC9YaVWGvXQAgYGJkm1z22IVZsQg8C4FnqMO0RfSPdZzRQQpOeWqVVwn/d
	 tbZYxi4biiIeP7j5sowWbYrIYaYPHUbl6E9u/Hb1PgFsoAvDomBTVSiXcNoiYWFJi0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:
	 In-Reply-To:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
	b=IvuRCToidWziIXee23N1n5fXUWPS2dk6qlig6MGQn62o+906zIH7J+DG/I2cG+n1T+LT
	 IMXg/6x6kt5XBBN1RVHsVCroqG2Vrx5NstbbpLbH31gZVem/e6lVu8YUkTelFht36nBwv
	 AaDClr8z3rrXpFhteef9MWZtuvp+Auw531Eb2b2aVROI2UI9uJVZCG6l0vSvhvfx6rmza
	 A0ogIgRjMS+92p5x3tK0M6WoNnbUOBNniJPJWsjmqWDuRstNAR4U7bb7sx5XY6ojJuRMi
	 VPlIwiLeFfgvrZDXmntuEgBqBNzatYdJ7lN3mzCDU/weG1fA/YouYWaAS6bKYRqzAMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jeffxu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WOmd94Mh;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586060841B6
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 20:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3586060841B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jeffxu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WOmd94Mh
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso772505eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 12:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793823296; x=1794428096; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
        b=WOmd94Mh+1IsHCPkayZDec6JPAxqUizBUQICw7d1GTvFYhvGyIcRDUYVGA4mrhJ2Gw
         LlwBfvWxf6C/dkbd/wYeCVyGFNqSQNTNemKeHNozM+B3thODy6YTQUG8zPI+Zc0fLAsc
         ywPjVR6u2U7pkPrIYEEEE7pR/Fv2GUmpGF5C6hZYbFhN+xzjvjlTlZgt1yXCOuMk8ZV8
         7dgvN0RspKuuDt9X8QL4OxxBptYW7RdbVtxUU3AipSC6ioGA6dVwnv5HTegyIPEZQbol
         lNJjqnZui4CPRajfzE+ydyWOkaI+BYJB/fWwmMyfr6ch4/bN/0JzLGDra0aJW3LNaEPF
         9UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823296; x=1794428096;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
        b=1bhAVZzuOr1wNizYCjOYZaWYHGXehChpyCi6Zrfce5UvQHnVu2UEUSe9FNapKAC4Wk
         KBOUU/vwW8wI8f9ezONGti9UcxVVNocSwIqXDr+253adiLW1p8tvKK3ar6v0GPXejOHU
         puGYwSqoLXycE7j2iCKXbwr6Vympzwa3ic7S5HiqsFPO+R4Llis46gqFuEOi/xJupUdD
         sUVJgv1d3CY3zU5I8tKbjQB5gBeqEs29rn2kzcbNYGXbJuMiQPrFWVF9ndHK1pK7jz1J
         Tb45nC6KWJPGC2QtRDyejW1nwHo4XR1KpWvznYGFA+SsW/rpljnJcthndYRj7O3syV1i
         TW9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwooZI1UjtzxpKOAhIR7aPINNHrWbrw/WO11GBm3Jux/UVJJT4WHNjRO4Hb4nKm4ZydfJDsjJX1amHPvgCC97Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ykGKuHnC2VF3N5gFPmmWQz0sQBRRJWwBHZ5wmi+UmMAuYiUZM
	x0Hz7kB+VEjjGIZ6bW1xKft2gVDykRq7uDsySuZ7nMGcUA6n/SjfZLwmnHsDGDXS8B0/79Iue9W
	DYpw3QQ==
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dybkf8.prod.google.com ([2002:a05:7301:3a88:b0:36a:e67:fbc2])
 (user=jeffxu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1608:b0:185:4ad4:3d15
 with SMTP id a92af1059eb24-1ac56302329mr19203878c88.1.1793823295901; Wed, 04
 Nov 2026 12:14:55 -0800 (PST)
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
Message-ID: <18e4f0c895c8d2ed.3137322e32382e342e3434.27cc5b.0000sendgmr@google.com>
Date: Wed, 04 Nov 2026 20:14:55 +0000
Subject: Re: [PATCH v2 0/8] mseal sysmap: Choose system mapping sealing at boot
From: Jeff Xu <jeffxu@google.com>
To: Chris Down <chris@chrisdown.name>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Kees Cook <kees@kernel.org>, Andrey Vagin <avagin@gmail.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Shuah Khan <shuah@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On Tue, Nov 3, 2026 at 11:17:43PM +0800, Chris Down wrote:
> System mapping sealing is currently a build time choice. Hosts which
> want it and hosts which need to move or unmap these mappings therefore
> need separate kernels, which is not ideal. Let's allow the administrator
> to choose at boot time.

Thanks Chris for the updates and for adding the unsealed boot parameter
test coverage! The v2 series looks good to me.

Reviewed-by: Jeff Xu <jeffxu@google.com>
