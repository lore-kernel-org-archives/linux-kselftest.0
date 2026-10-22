Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707450;
	b=LZGY0bG2M0u7RToPmBIHfbb3XwsXVKU/HF4ednvF3RqEdGOz1cXubS6NvubElaqGYlFk
	 IrVTBO0+qVlJgDjFPS1R9GNF020Bi5dH75hn3w6up26Z51hG1jQTh8zJc33e6HPMbUTGX
	 j+uGUYtv/JosQOtJlgy81t0a0l5GoLboYc58E8u700lNPRsWrGZg4K7w0YTh0+8mC2+Ow
	 8cq/pbqj6/bRMqZaMBspLuOxtrm5PTWF74SZTUEczWFRp9ZCY/Qyw3B2BE9LAMIWsLGzU
	 cL6Qdc9i50krfo4R0vWk0ixPcPA5HR5CtteCosEscTA6JJR4/AeKjbX76dXnC0/uozw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lomsEIzafjLVZya86Pfl4U9atLbvZi9DCA+wyh807aw=;
	b=wawq/YTcLsV9qbtiMqOJ1P/t3vwQxFA0sECVoPE/Gm5kl2DOnhIMGWRg8SRSXS5f+hiC
	 qsodx/uwwNTCe/a+fIbsdUL2wP5PVFYh4ykzlQxhd0OQuAB+9XXPHO72pZTh2dnIuE4LR
	 CjuGlSCbHsnmwnxvHgiNS+eWIiJ6L7IvcISIIFOZ0D1Ga/AtQ0PQ7//pxVo3Zcu5Pf4NG
	 1jdRLZwl+WNWn/IaP8blOqPbAlgRUWN/Uw1fjtJtwwFISP2Yl+n1+Q0ICdmK5fEzbQeAV
	 oA/V8TaWvLAzA/9ZAQWsJaNXZ7PscaeAMrGlMBUq6yumdlkh2XB2rF+pnOTemjLnVHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UGp6xEo4;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B1606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42B1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UGp6xEo4
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eae12762c9so159589e0c.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792707448; x=1793312248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lomsEIzafjLVZya86Pfl4U9atLbvZi9DCA+wyh807aw=;
        b=UGp6xEo46X7hYGvsFsa/zX4GnG5h62cMJTqHLj8i8AKrS9J3hbUQrjgzFhQipOB5s0
         hCxwO0BSTsvVFwyx5H+uP2v2FKo5IInzNPnr0u0dUnEcQ3YPFbSzJVc4eXZAJG+j8NLb
         tSPUe8oEQSj9qbppiYXKURYXMHrj3PZbj8ekQuBAzgtsgoX6EzPtpixHmmCuj75hZX9C
         DaIeyR/G+EZyir/jT5XvHZ3HMlKd1Ub3kwmD/yklUnqz7a5LrPCbKekEAN7kN85d3mbh
         diyanZfKbfsdUp25hWiQMSXGYxyDEmbSflG/8REV/USoftVz+HLZcUtcJ/HGlMUXVlRk
         GoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707448; x=1793312248;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lomsEIzafjLVZya86Pfl4U9atLbvZi9DCA+wyh807aw=;
        b=zN/VrlDN7BCEA1RYEhjh9MXnOgDYOJCFskeL0vVzalnp0vxsB5FVJ7bHtVe4PliusU
         ywUEvHRwUKV55w5kGOfxilF+HB894gpdxW2wI/9Z68toI9mpn0jyKYJsyMt7NRslfatN
         tJlIpndbfd8WTK6OkummAuAbZ57DTptP/CJbGaILqMpdgYo6q/KiAgsmYxTfoL3Pqxfw
         nbKC3afWV4hD3HDw5PL/tqkFBfhhzXYZ2IA99WAzqNAPZ3OsBPS5x3DjYkHfvtO0Cp6G
         aKMiBU7k6tQnX24s55kh/pGfqrvv2I1UkkNGU1jNfr+hbjl2mHyM4GubXMnOJTwJHY0r
         CMUg==
X-Forwarded-Encrypted: i=1; AKwUvByz9edeoJvDRqNsYTJCsg2hy3zww288W6q9dJu9ElJbkH7N/HJEJDaNZUipZfLSIr17yp+47O+n4sYjHQiaSIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMkyE5v1q1WrecXayP/qjw8/0dFzIXQALOLNVtjkLD90FdsBQR
	/a5ReZYI0M7aKsLWVFp1LFkYoHzmq8HX4sWxMPBXCe/7in8YiqhtsVYh
X-Gm-Gg: AYBFou2w3tK0xUUN1Or0eMmHNkqvJoUF2p4EX/S22s0LZKUd8ESTRiRfjEaSy36rlW3
	RIeDxITQV8D3q8IHq6D63rc4Q1xLUEjmXc8ZTLa0TA5YGbcvhI6u/g43lwDFz1Ix/66APk3r7NN
	ZI83zysQBUAmypVMyIwmZzLNH6GeNouppuPclQC+qmU//oK21zcekrzDA9A1xitgrZvHy95XUal
	Hz1D8Q6sNVlBtLszRKYUSpcE3nYQ1OYrJVPvd7cOuspivAcO8u+ACLItkPo54hcI6MygyrDUwjw
	ABkiunZfx4RfR+JtZXzEw2Q+GTNmshjLhfby9Uf8OJRc5uYJe8SYpzTJ377DotMIbL1zdOZGftI
	DSy2XkefwSalGcqQ8H/ixwSjZf9Dbx8T45DaSH5kTSRWqZX3kg9/53urLIs38OKhk7+O9xgPNt0
	Qy4kEJrKSRa6INoBzws80EBFVqtznihH1utsFglqxeDnN8WDI6dScXhDMjRNcm8JmFNB2V+X98z
	scDwS5kU9bwGQ0txbA02m2d12sGpX/BKxvnRxrEip1CRAfOIQ==
X-Received: by 2002:a05:6122:3d08:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ec14a789ebmr114559e0c.12.1792707448568;
        Thu, 22 Oct 2026 15:17:28 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f2cfe0sm456271e0c.14.2026.10.22.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:17:28 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v2 0/2] x86/shstk: don't leak a shadow stack when clone TLS fails
Date: Thu, 22 Oct 2026 19:17:19 -0300
Message-ID: <20261022221722.619233-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023147.519257-1-ivanrwcm25@gmail.com>
References: <20261015023147.519257-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

copy_thread() maps a shadow stack and set_new_tls() can still fail.
That error goes to bad_fork_cleanup_io and skips exit_thread().
bad_fork_cleanup_thread calls exit_thread() only after copy_thread()
has returned 0.

commit 748c90c69336 ("x86/shstk: Remove useless clone error handling")
removed the shstk_free() on the set_new_tls() failure. Restoring it
only there puts back the single free. The allocation-error return
still aliases the parent, and the exit_thread() path is left alone,
so the double unmap that commit avoided does not come back.

The selftest uses kselftest.h / KTAP. Feature and clone3 availability
skips run before ksft_set_plan(). Missing /proc/self/smaps is SKIP.
Read errors, truncated smaps lines, and a VMA range without VmFlags
are FAIL. A valid-TLS clone3 must succeed before EPERM on a bad TLS
counts as the leak path; ENOSYS/EPERM/EACCES SKIP that control.

Regression (CONFIG_X86_USER_SHADOW_STACK=y, host and one-vCPU KVM
-cpu host,migratable=off):

  Scenario                         Without fix          With fix
  16 bad-TLS clone3                +16 ss VMAs          +0 ss VMAs
  Parent shadow stack              kept + call/ret OK   kept + call/ret OK
  KTAP                             2/3 (test 3 fail)    3/3 pass

Changes in v2:

- Nest the TLS error check under CLONE_SETTLS, as suggested by Rick
  Edgecombe.

- Use a dedicated shadow-stack cleanup label.

- Return zero explicitly on the successful path.

- Remove the redundant cleanup comment.

- Selftest: rewrite on kselftest.h / KTAP (plan 3). Fix RDSSPQ
  comment; align get_ssp() with test_shadow_stack; SKIP only
  ENOSYS/EPERM/EACCES on the valid-TLS control; FAIL on truncated or
  incomplete smaps records that would under-count ss VMAs.

Link: https://lore.kernel.org/lkml/20261015023147.519257-1-ivanrwcm25@gmail.com/

Iván Ezequiel Rodriguez (2):
  x86/shstk: free shadow stack when copy_thread() fails
  selftests/x86: shadow stack must survive a bad TLS

 arch/x86/kernel/process.c                     |  13 +-
 tools/testing/selftests/x86/Makefile          |   3 +-
 tools/testing/selftests/x86/shstk_clone_tls.c | 334 ++++++++++++++++++
 3 files changed, 346 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/x86/shstk_clone_tls.c

-- 
2.43.0

