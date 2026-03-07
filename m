Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D536413DDAA
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Mar 2026 00:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772842315; cv=pass; b=e8FVMP27AiCuVXlGS+UTbI5rXL4We4ZIuYAYyHzSBdhD5IPhV+P6lXS5vD02URFWDaMJrRf7vGusYxR0Z0egbpUlD7YhwvQJuv63aABO3ubI419p8F7jTk14QAfPrC6ozIFesejnZ/lXF09sERxmcKeEZyGhMMJBp8OlirEpsKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772842315; c=relaxed/simple;
	bh=HgKcstrIYQl9x5oWbLGZjwkY9nmjJZ0Y1THp/KSzgGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCGLsVnm8wMrGnFUVlvvCwfrFGmuG/VrX0Gv3+44XE/CdKi0moC5MS9ZbrsvlGJj3TSpm/bDzUrsDQ21dezrTxQXaaXX1RO2QewPhwdsIHQ/2q4McMdLOrxrJGLUolcsM/XCO6DrcSvmsnANNeYSQ38FE0an8FTk4aEDPSWz9ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mv6tFWrk; arc=pass smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv6tFWrk"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-439afc58ac7so6814384f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 16:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772842312; cv=none;
        d=google.com; s=arc-20240605;
        b=hO2N3Mpa5Zj5u8wLKoa9zb3HXFM1YRRNteNfF8cc/DbYq5NEQFy6poPHv5s9VMeDqe
         MdW1VDmfRWl+mUieIYH5KA0SDgdN/s8jwZzmJ2sB6QwYE3me4vrUgeiUVSP0/s31HBtJ
         8dCJ0cJz/ybCMwzUJEjvmDGxkLkX4dUbRf5KTXLIpwunNw1t/Wu2H4g1KfJosqD9TWTa
         IIppgBGQ5lrQHQnmg5lKUDBwntoQ1QHFooQCf7Hob3jcihCjCOvYI195TQRhnnV215QB
         MksG+GUTC427uWVrz5UsnO0ymnjMs1Vkk22DHmIMifz+VoihibJ6Dd54XxJ9LgnshDvP
         R4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HgKcstrIYQl9x5oWbLGZjwkY9nmjJZ0Y1THp/KSzgGA=;
        fh=6XlgxR0VtrHBMKIuvtjUWZ4dAa0atIH4p0ailAtJ5tM=;
        b=VlRYCko/OoBpG5+tZAPf2rD633EgaAv3eQxaaNmgvRL+kIWgYQzoaQ3SOYZbD+Oxnt
         SOn1fTahZ2/c+Va0neQPspPzxJuMFwPyjFsBvjunSbR+PUhOgu1YoVLal2N0B8VQl9fl
         Sz2lpALiBRDsZJHq7CLCEvszKkbrJ62aflwK8ORZJV7F5N7aVMBQE0F1z9UQABLxGXSO
         IOCzoB62HrzGKBYvPHvniotLuN2YyYfPrtXlp/m1ixYWskUUs557MNPUEo1va0XA2Sbp
         8W8kbazdIUxa5p8Oxum0yoMHxfXdpj7v3Vv3LxtUTxGpI/B6jAdavD0904sYg//0ckbf
         ARuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772842312; x=1773447112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HgKcstrIYQl9x5oWbLGZjwkY9nmjJZ0Y1THp/KSzgGA=;
        b=Mv6tFWrkT18Y+wmDQt8sQ9R0XLYA2qdlwyW55yCh0oHUAS0So67XtwWqWlD/14u0Xx
         Dzns3p2v22063ufgB7QPIuyI4b09yRoXxSKYDv+DASM7KENhmihN4dejz0vc+ITqxM3X
         gzzHodgzkhiT/thmqR1usEd+arN9UJaobTch4E65tnc6S23HDg/AjVdjzz+lCz5UmDX4
         MKXb0FmsAbS32cqAED4bqvRplMyb7RruHrXx1Od0pBUPaE2PghQHuCtr95VyJ1Fzh+fE
         spCTdi8aLrO+M6OCya07T6KgcA6vx5tihXu2qgi64857yv7MXhE+26BhPj/54fMhU8YN
         fAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772842312; x=1773447112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgKcstrIYQl9x5oWbLGZjwkY9nmjJZ0Y1THp/KSzgGA=;
        b=hUOyvKrg4zrZET9uF1CO8ww1btKKf2CoB3EoQkYlJXGzZ31Pl/aSTRr+pLh6WMdk6L
         USBvuK0rCrkbmz0QR28coF536ArvMsqPjOv6bWZHKpnzRBbFr9ggS5jSb5H/nxeEy2qy
         yyT3IrZX9wiOARjS0rkZKKGZwF8m+A6tXD58UxL8qwOzKRPWeV5p6LzlCFBKqihn+Jkb
         xxkTFCS6SKkRPSsM4QcVHaudMRx6Mikmg7WGDFVApYdEgjd/qIdtjzeHnHKXhbgaYtW8
         YqzOenwi6oQus/NtIgdzz3+FOXQgx7jzeFlRwrwRre8d23SpEMAvqvCCcHuoYuiC2V0G
         am9A==
X-Forwarded-Encrypted: i=1; AJvYcCXgMVD5ehF68NiQERHd+vrqS69Op5cB53pCc6wHsXuFfvEL4CfkV2OtJtGncEZTgFV0fzVWCLAgkDy8HXz0m+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBCF6FbD4KpYW6HCRxyWNGV7gQb1mElg61uQrPm56A+zjfnxQX
	E11+qlVPhchcGZQcaridRwfxRkyYvZMVAH2OHdOwPJ+oqOO478sye77ahV83oWxTcy75bPWdQ4r
	chzts3ek0ZSbiGxtQBnx9CUmXcV99aw4=
X-Gm-Gg: ATEYQzw79jMr164+z9aPYmu2+hErFdWol7poEKBdnTGOOY0a9YHQJnJSGHicW6sgw0E
	MoASvc1htBYesKla3pzc38ky6xPrPNqMXk1Dp5hYTpCc0+vvFRaEnXjxx675vJgT2UGqGzYtU71
	bvLl72pj4UwD4udy7Zozqjrpqgni4FOZ1GxXNYzO4/uNzvqLyaxn55qIxgz8GCnG4P5DPlAH9VR
	9QtED2i8iWHcxi32ddlRbenmPQU1av0VC3JR7TkTw4pVolkJHSdQLuAvyyFd6CctYsD3dChlBK/
	Je4cBmIKwrOT8FA8aX/k7qYsrXGNdWEUa0lG6jZPnSGDyUvRBvViXempUOk=
X-Received: by 2002:a5d:5f84:0:b0:439:8580:181 with SMTP id
 ffacd0b85a97d-439da89ea7fmr6848894f8f.52.1772842312052; Fri, 06 Mar 2026
 16:11:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306083330.518627-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260306083330.518627-1-sun.jian.kdev@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 7 Mar 2026 01:11:15 +0100
X-Gm-Features: AaiRm51N-jBt4fdfi663B6taShcS8Y3p1eyaEPu_RJ_GMA655_c7cCYiVSkGd08
Message-ID: <CAP01T74GzzNuqRVQ6-hk8KpmV2t-CEa1KuF4mAvh6jiQkhaLCA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] selftests/bpf: filter by pid to avoid cross-test interference
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Mar 2026 at 09:35, Sun Jian <sun.jian.kdev@gmail.com> wrote:
>
> The test installs a kprobe on __sys_connect and checks that
> bpf_probe_write_user() can modify the syscall argument. However, any
> concurrent thread in any other test that calls connect() will also
> trigger the kprobe and have its sockaddr silently overwritten, causing
> flaky failures in unrelated tests.
>
> Constrain the hook to the current test process by filtering on a PID
> stored as a global variable in .bss. Initialize the .bss value from
> user space before bpf_object__load() using bpf_map__set_initial_value(),
> and validate the bss map value size to catch layout mismatches.
>
> No new map is introduced and the test keeps the existing non-skeleton
> flow.
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>
> [...]
