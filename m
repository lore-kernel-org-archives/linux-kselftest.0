Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151465;
	b=4oAWiSeWaGSARY2ddnOQzSJ8xveYLEIBscYYumNTAtnLHCXfheQBaR7QOkgc+KPRRCcF
	 kfQ46P5yusiw3v3y+x5uzO2IOibpzuK9TR6bftuaU18VqZPakQlXEVR6H8VPOCCqrP3Xz
	 QrxFCHjwOnPUSJc6/gKXNByv3Kw07/t/Bx/oZf9Y5289B8nMdcInnwdJHVb4c/vTJ+GYv
	 jb6MKucg0grG4XQ5Kh4BR6CG1nSNtetVVxbSHZ4blT7XyVKRG+AOR7STRMl8NMG3ulWno
	 KqG7bFZ2/UIol0qHCL9fj2WPw5tx/nvzL2GlB8vE9/j3NFdOqtpE3KwUEAovpyCBreQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UxG7GXUsicfCIDfMFjBbx3umG5dZ58gNRJ1FSEEffBI=;
	b=L7ocZ7S8+SR958ltvFQkaiTmTJ7icxD5kzWgPfajeOgMUSf3NkHxCX2KazEDZANLywXy
	 xml0tZifmmf37sAvW9vo9aiyUKAIhQcTcnZ+kpO7kj7McRvFhgODoUpxxXWfB8L9jZIEf
	 Xu2Oj8bhdm0RjbVB3MbbNuiXim0AryCxPaf0iI/L40tdIzhRvRfjNWy1sHGyIUqSaPqlN
	 GjaDDvg6SHhq7SmL3wQohsYP1qTnsScQyeQB1QSamVWhjbHx09S1n9J3tUhr/Kex9BwvX
	 6k8Jybhh4SPN+cixR83jzy6RmGexdfhU8tVMnCLVGqtu/rfKjU2Ah1Vz/7nj+7w5X/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=gD+h8bUO;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4CB606A339
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4CB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=gD+h8bUO
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eabf243d05so32172e0c.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151464; x=1794756264; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UxG7GXUsicfCIDfMFjBbx3umG5dZ58gNRJ1FSEEffBI=;
        b=gD+h8bUO+1L/eQe9FHB+DiMx8C47qRTq+a4g17dQYS7gvvFLCuTolDCZ6PARdyuXX4
         acZ8D3aMWZ0aa6cKiWw9k1VJHJ1iQr2VAspHk/gWMdyNJBMzXmWegP7sBmZbKxuy/GSM
         6JAoTLO82VE48THmZelnCmHqMMm+d64i6eKciHmwUjRaXLqRLW9AGr46IB6G6vAJhh/k
         hCcFJPPLlmZDQzIFVS4FxKV5X+kj5htqBjd1kuQ4F7VFC3wktmsCi0fwrK1CkrxfLKaw
         qJo6qjeZqvDolqJMLqt0LmJuAa+/3+PlkUh7G1Z3cDLjttC66XM4ejrBpHkqVxcvNXZJ
         fH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151464; x=1794756264;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxG7GXUsicfCIDfMFjBbx3umG5dZ58gNRJ1FSEEffBI=;
        b=1D35FZboFQQ6a32tQF12e0qhRxp9ssDGL3HdzamwrL25C9HJusTi2kEIRjEGV+syBu
         WUTGPl/JL/N/HtETnE9KF449ypXx3EilnFnDl/seRuzXME91VXdjm+jr5krxseOnVSKF
         SvKYj+jxeaRbvN8RUhPYXMvx0WwpkUiujKVhzHDHRaegoIL8nV0lOt3VIng/7aczqWab
         XMIWgsb9J8+tU+Rn9mA5dVNQ9Bvyqlrm8dhEq6Omu2ybwRZTsmSAtaoctYMF0tXuLrvf
         I/e0f4q4g7srQGdbfYGBqLdOy678BfvWoMYUJPJ67xj8q5WE6G+HlRWEd9vVQ5ga2u2S
         iT4Q==
X-Forwarded-Encrypted: i=1; AL+hErH8nXcpjFEovMZoX2t2FzLw5+RqBvFPltNSZnsVnWUAw4BN9m2td5FxKnxoqLz8fSUEFJhuJ9Ej/yITN73Oerg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aI0CSG4d4vqKsKml4JWJneIuGHl93TwEOeNrkKMHBPNeFcJkI
	0O1Iew39po6hw1GIkc4l3FoZsfco9Ux9CRnilD0uAe8/QGwDCiR4SiXOt+QuODhbzsk=
X-Gm-Gg: AYBFou0FStJ0ugvoKZBiw9B7XYnVpY2O3pm2/OM8kR4X7nacAcBzBq7RPUQySCaVrRh
	gZ3nblD+L2NRrzRD+wAiVma+03gDllT8Zx3+qB7sbbCNvvzwlZKa4kmA7a6BBOo1ITN1pEzYJvI
	OKWse9FhefxMO5DZoIr98amjo8WZtl/Z4OvaXt9/mRDjuvLO1ewdz51oBl+Qc9t5JCbQ7hGqq8Q
	AbqRtyAukT9KOkyE9StfS31JQ39qcamK3Reg/eC2VGDo33XP/VWQvPVH8iOUIGc1b9AGwP64kdp
	vTJeA2jUZ+FexUiPr9cNJDnY1gOmXY8nMflitJhMuBDmYrmpF3sYQQgZZ3nhfbXxcjtMRzk81/6
	wlllHsoRzpye51l1LuHn5wHAss1Q694dPzS3gGibBquHWEo36uVvcDF3kmlJRiWAJ8uIL8s63m4
	HMwcTIdsFRL+7Ciyv0mwQDVuNDFDKPbg4Ds7qXyiS1UrQeIfLRuurSeHGxzK/0eKTcB6fbfV8BR
	IyrjXyx0JpCIYrhRE7r+ncjPCjygaqsyyTA7SKPVaGHBhmbzCxVDIGhNJcLl3R05SShIoFwaDuW
	p3QcXUj58kmxLY2a4gKhgahLQmEbOsPbQ2Ml+TKob/1DUUwiL3kClPDUydEVNvEv2q3h8QdOI59
	BhHXzrX1BG7KmGcU+MWUVrC9BQSCgf1P9jNNEzzoCcCRZi4M=
X-Received: by 2002:a05:6122:546:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ece725fcc1mr534957e0c.17.1794151463870;
        Sun, 08 Nov 2026 07:24:23 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:22 -0800 (PST)
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
Subject: Re: [PATCH v3 4/4] selftests: liveupdate: Add riscv support
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-5-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-5-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145359.358073.275309518363721943.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=417;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=FtmrOogkqyUZ+q/8/Vic7Il7P35EARJys1IQgDvRVIs=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQhVEhYRlNImO2ueIVy23Pfe/4w2LJsKj2WG
 qH/Tmd7+XeJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIQAKCRC7dyhM23N6
 3vP+D/sGPpbNDhlfiFA68lnaSlf3Ud1W6sEIzkODc2Rr/nh/XGhE/+iIjOkpoSCxRJE/NO9C+DG
 jRVkLElYMybWKAUMrMtK/FIY/Mmj3rQk8/+k2K6EyT8bp5Y5pm3UJWc3keXSIflkIzqBrdk8OXd
 jc5vEvhN6qdxqdjUra55/a8LMtN17XIqisUGChRTOKnezNh85HlE5QXwKBWEqOhTZjrKrntjYer
 eOUgHTCNquEbY7APFlbwpmVAwBwissclqIuP6RyhNBxnQRqOXacs8aiRer/a3lrBw56srBMgGEF
 Rz9b6ezMwvCKh5xpZJRAGlCpYcn4mztgSYF7qcsBmQdYhJq7h6bupQliFFODDM+BF8IPhTU0qYp
 JpCLkQvAUYKCSzApDXp4mGTNdwfPr+Dn/vL7vv21BiZ3nYC2zdmt8L3v34AoMkQuK+a0s1nUWMh
 syI3MknQ2599AHAVwKArwt3/21IjEzIIbZzcZdO+XsALXP79CbPrgN3Tz6Z+h1Dr8LB3dmfQTFm
 nhFIECmygvfqj7AVJQhQeN3IHyDJyyhpqLb3t7HlTEs4+MYEROzKSC+8ZZogWFtGCHVfovlcKgP
 uKerMtzV8HQ4ZSBMJ1ZQ5PX9EMGpc8uOa/dLCjDJX6tjUtcIEoU0vWb/7qtwlMVuPp0e1ny0g4M
 TnCpyQ6RyzM/VOw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 06 Nov 2026 15:14:59 +0800, Chen Pei <cp0613@linux.alibaba.com> wrote:
> Teach the live update vmtest runners about riscv64, so the LUO tests can
> be run on this architecture.
> 
> LIVEUPDATE depends only on KEXEC_HANDOVER, enabled for riscv64 by the
> previous commit, so nothing in the tests stood in the way.
> 
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

