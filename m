Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409857;
	b=o7NnLKPgizl965LW3ysXT7KfANTk+O1xWr5j+4PbhHNDoN0D8xH8NXBdYgBl/eMOLgdd
	 YVyRJZHneMs2fYxYDd7YLAEA2UVrxGPKC116Xm+5srv8iInPSCvdkue9QK+6r1fx3E0mh
	 8zH2Zhhnyg6PCtnE07XtBrPlFUTSWvF3uUG33KyE8eGWKGLmrA5JY/qAHvwoPA0YuKQc8
	 6XbIoBhTaeNlhutKPxG/chRcF7hrEvS8vfob7s6AV5ews8gwav1KHQKJc1oFFCpy0vLDa
	 P25UYfAXmEv8gy3Ei15iayKdOfcY4mOKhzegnj7O2tGFo0bHnOVF5iynUVn44cr5ZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=0mdcGcj64GzmYrPJu0IJ0WiOiRlU4XegUX2JgumUSPU=;
	b=2AqCU9AptHhtsfIR/7V/FAVIud7ggVda1easTRfv/p8kLPLLFSpkVNAURde0QCWPyYe8
	 42Hlxb4dZ9LgmECmOChfElKbRI8pL0TncD8O0Upnc8GdnHIqHUGhqRJL2OM8Xd+CXPNzr
	 uHjKdZHQEpnlU/4BUGxlmUy/L8QugTCxaLm7gApJBmqrNKMI03T/rTBIMFrfOM9MH4ydR
	 4X/7jXX09oR7Ax/n7C+Pvu/905BBOvu0LgXvOtgn1w2qYlCS4jMgsQIAyBdmL8lcHkHOY
	 S1j1+sZAhwb/bU4Ph6Coe0Jt9N2+dWwvHbmoEA+TosSGQbFbdtJ87YZIEiZkXew48FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tweek.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f+0TaIQ9;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CDE606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 04:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CDE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f+0TaIQ9
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so3156205a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 20:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795409856; x=1796014656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0mdcGcj64GzmYrPJu0IJ0WiOiRlU4XegUX2JgumUSPU=;
        b=f+0TaIQ92aaD4E6HWxGZ1hEOJhcf912s2CGZV3r4sgOEM0FbWWxzfGD1g9hffdV0Ty
         xcg9ilasgR0cmJv2J03GHKbpLfUo6q2GupFjNFuXNd2NfnidxtOXplmB5G2AnhsM7AEF
         D2GqSVPSwATNGNXGR5GU6ESADEEm941zNuPC1zR2zy5LEP838q9xekLnVRQm+cAPRK8Y
         B+FsNOBg+K0InPTARivucXHlV8aLswYEyPTMrKckuVoqoCZBlHjiqnb19ULZxekUNIgP
         7lU8KrfsR1fvROmuLBTHy3+DB2Wq2YnUj6HUpKRQVFNwMQTrhRAfT12entgDC1YqTmZS
         Ie6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409856; x=1796014656;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mdcGcj64GzmYrPJu0IJ0WiOiRlU4XegUX2JgumUSPU=;
        b=hSMeyyawSspxTHnKOExWW+rmdz2MGhoN7PHPo98IX3S3ULvMmjqZrY0lDjGUkIn6mY
         vaL1NaBXENIpBH6+89pNja56w81qK7joXmX81E/got3oQkxyz8ECdcQPS3IE5npMHweJ
         xZe/RDCXde9F9RSAN07FIYEOiYBmJGKIeeeSJNftzhPMr968vZcaWQYGp8hBTmtZpnW6
         93YU29Szph8ZYvr0bQlzgofYdiOTYj1oM5C4SZ+NVhOOD8tlAPvDVNbkEE89vJUAIGWJ
         e4hrFqRqwsVhG+K8sqi2Gr8qb5JZZQBUED6Ln9yVkDo9WUrlWCCRSD4J3WAknx5hJvwm
         wRhA==
X-Forwarded-Encrypted: i=1; AL+hErHiY32L2pVGndavhtD5PWmHxcL8tSHk08ZvN0NP+VcfIO9RJgrijx36M0nQXXKnDXVQIt0XwO0CVqscwS64k+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CLXVWLFRDKDx/2qDYfbUxZE3raq+h29Eh/H9YBtxbyKS6K+Uj
	jUXczCe7IaMcH4zXPlHWsxRHXHX7a3AjyuwRh1bQ3MJCmKUxChfOcvRUgQF9mWSABk7Yqm34JU4
	d5g==
X-Received: from pfwy15.prod.google.com ([2002:a05:6a00:1c8f:b0:89d:e040:c63e])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7489:b0:3e0:e60f:2e5b
 with SMTP id adf61e73a8af0-4014c948925mr9728669637.30.1795409856438; Sun, 22
 Nov 2026 20:57:36 -0800 (PST)
Date: Mon, 23 Nov 2026 15:57:28 +1100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123045730.1960346-1-tweek@google.com>
Subject: [PATCH bpf 0/2] libbpf: Skip BPF token preparation for gen_loader
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Sid Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When generating a loader program offline (obj->gen_loader), libbpf emits
loader instructions rather than issuing BPF syscalls on the host. While
other host-interaction steps in bpf_object_prepare() already skip
execution under obj->gen_loader, bpf_object_prepare_token() does not.

This causes offline loader generation (such as bpftool gen skeleton -L)
to probe /sys/fs/bpf and honor LIBBPF_BPF_TOKEN_PATH. If the build host
has a token-delegated bpffs mounted, libbpf acquires a token FD and ORs
BPF_F_TOKEN_FD into map_flags and prog_flags without gen_loader
serializing any token_fd, producing a broken loader blob.

Patch 1 skips bpf_object_prepare_token() when obj->gen_loader is set.
Patch 2 adds a token/obj_gen_loader_no_token selftest covering implicit
/sys/fs/bpf delegation, explicit bpf_token_path, and an invalid
LIBBPF_BPF_TOKEN_PATH.

Thi=C3=A9baud Weksteen (2):
  libbpf: Skip BPF token preparation when generating loader
  selftests/bpf: Verify gen_loader skips BPF token preparation

 tools/lib/bpf/libbpf.c                        |  3 +
 .../testing/selftests/bpf/prog_tests/token.c  | 82 +++++++++++++++++++
 2 files changed, 85 insertions(+)


base-commit: 84afebd853437e44cb71f718be11d90e4c1a59dd
--=20
2.56.1.750.gf70dc682cf-goog

