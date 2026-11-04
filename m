Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758803;
	b=F8QWgeeAPCxTNAHRH/RDfJmr6p9zI2qhImVa78g+/C917PI5chjOGNXqXzGl7nEfMxn/
	 GFueWpJc11glJ/HyQv6YcNtgImsrXHvOjr4Z/Bh08X6WI2ANhfwtee5BxnN0q7ulW3jv3
	 bj5b9FVZcagnicPpGj6f2fKq5JZI4OGWtduzvje53xUCvhOUl5QC4VbB6YWblle1U7hrH
	 T6AsbscAKpBxtCUUpFELSiJABeWUSd0n1dKEwHxijBRecC++aBCYo1HN8qPuP0UYMdPAl
	 ZBDB8scxybpjz8sDgUeSNSnRJ6NqFULRPrPj/5chr10HhSkL/X9NGC0yTxk73k15haw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=rXti7mY5F0P/rsGwIECfqLmvwSGUaMqT4P5dq57Cx/E=;
	b=ZVGfZYMuTloyMpUEIwjCZtpK+CixjYE5Bna98wxE8hWFQyw5WlqATImNdwmbVSMc6mQo
	 pCnGG5PKOXMblgsb4zXi/ueQtQ9dNZTQi3o0hylGZo3e+zIB+p72s9cMIsQe2wPyENGz0
	 XLYPJfC9P7mgli/v7cPHp1ZEzfPDm/ImhJ8YScDcevC6Fx6MB3HzGyiYUD+IYPc5KLU2s
	 736UGeoz2QM8H2QdBPOWSlFRAJrfMMhfAOLTm6zMFQRBptML5WR9+gnIj/68KlCwvVy5r
	 PUkuIqwJP+MP/OIENA9Nk7NDvW3U6h7kiXsUSzsO5zu3/P+Nl4uo/H134Pyl02JH+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PBzi9TIP;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD7D606A326
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 02:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD7D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PBzi9TIP
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eafb65e169so109693e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 18:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793758802; x=1794363602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXti7mY5F0P/rsGwIECfqLmvwSGUaMqT4P5dq57Cx/E=;
        b=PBzi9TIPsFLl2TMl7s8o/VQCNOJaYL9ZQIfaatArXX0Yipg0kgF/Q22Qxg0e3TPsPj
         G7J5AJvAyRg+QuPemaLMBmz6UI38bZuLnlIfZYYpFqa5YR1W6GxX+JipDVu1Xaryz7Jp
         k2+Gl5Ck3VPZOS86WtvarxWRgseghf/K5zcs1wx8wzvPIWVHkTsFgg2rCb90zdrXX5i8
         Ds3R7tBrV4eXU4udYmaeWPJijUI4+OoqZkO1SCRkivf4ScPXBZaw7j5L9EvUJv4VQsk4
         2ntuTVc8jkaDg/zQ90kByToA9Q/IyV3j59zMBVNp6RnNa3aOIQnzIXfu3Vcq26X2VFqq
         usRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758802; x=1794363602;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXti7mY5F0P/rsGwIECfqLmvwSGUaMqT4P5dq57Cx/E=;
        b=T31+HiH5hZto3vxCK8PqBvgnhO0l/JLmikH2QGNS/+pOJpkTu3/AFh8GN/YKSSDqDl
         bLtYN41o3fijmjvhOG+vSj8vImXKwcGyaEryTTRXUzYdGsuqVj+fSasl4XsVrnopJims
         eoDk5BVPm9RIzQSBfx+oYVEWrHcgg0viu0IrZ+LU/Qz7ZlNoO6NNbMi31IGya+AUsQkX
         BXMQCvkZSRpM/TicV8fqfGI58ylDnVkOfpzk2PkMhDeWkFVdkX6O6anV3MjRB7wo//Ui
         dEEk+2gUTichOm2QEzDZPXLzClTiC58Ppcf25eZpkfrSi3wJ2ipALd8fKNX5Qo81mtQN
         t+NA==
X-Forwarded-Encrypted: i=1; AKwUvBxTyfsX64vn6Hu1yL/gDGZxBJCRD3QuNB9L1Jqx4WBYpuBBYQpOQdDouQgBML+XePh1ZJIHxstNfuBYVhqR0nM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jmZwQvcjcHcnn4g9qKe8PQFyxMz4ae48IwMVmG3IfTRXGjfeL
	C3VpgG56f7mytQ9VpGX+E9ZeE4ZXikM4hwSRPRH7PZgCpuKEk/IN4UOa/1FITylHfrZr2GwAjdm
	sFk0/
X-Gm-Gg: AYBFou1JKpLIPIdazDuE9qQzV7bOvlHdvufTUYMYomo98LDTkhWyyfea/4xWEUTVTF2
	xM/tFXiJ3AhvIL+7o0APAhDIqRSnWCgBiCll0MtE8CSMq6gidZOoBBo+LmlHbWWWno2/hzi40FH
	3EKLsdVqMSFhETvP+u0jb6dGpvSDpkq06uJ9YcQcyEtPEM3lT03l9pDSDjdLdr099Dt803cM623
	KUgr51xfNluGJ+7Ig3XIpWQVUYhtjkK8floBPfZV+X380DhULmCP5sm+QdfX0av50sCqvjjnQIM
	7/v8MEUbbTMIF12vNNUiU3FQwvXF7PcMOncYV019wIeP6OFPZlPTJbMMX+vdpjUYYvXWfk4eZFa
	VmCYdbkYAj3/K1qs9827j4w4nRgr0GXPgRahwGvFUncsLyrOFf4d46FW4b7WfWN0U0zE1hloAdt
	Zy67SQKjbPT8/PNRulCpC7rggf+KlZsOryXHUhgXfCJnb4ECJKGmEjjAKX219SZFBfDRVHV/++V
	G4MNJj1ep07ocUQFqNurv0oP5eJCc86m1ckar+qo2jtQ35jD60lNmjpuBB+p3W+7ladW0hUZLEF
	NzokaPkIYWg0XaB1uYGI3YHypnNWQWIpqF0vXXsDnkuxxW9dXmp6ychtoWvdygMRottU8d/8p0V
	Y32rsuYT93olsHcpXzBTsN/UWfkv8AbBWw5FiZ3i2lEO0
X-Received: by 2002:a05:6122:130e:b0:5ca:f811:25ac with SMTP id 71dfb90a1353d-5ec6895c285mr6125913e0c.14.1793758802245;
        Tue, 03 Nov 2026 18:20:02 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b6568sm658959e0c.1.2026.11.03.18.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:20:01 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: rppt@kernel.org, pratyush@kernel.org, shuah@kernel.org, 
 George Guo <dongtai.guo@linux.dev>
Cc: guodongtai@kylinos.cn, kexec@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029090542.13283-1-dongtai.guo@linux.dev>
References: <20261029090542.13283-1-dongtai.guo@linux.dev>
Subject: Re: [PATCH] selftests/liveupdate: Preserve VM workspaces with
 run-vmtests.sh -k
Message-Id: <179375880152.1029434.132459394322366594.b4-ty@b4>
Date: Tue, 03 Nov 2026 21:20:01 -0500
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
X-Mailer: b4 0.16.0

On Thu, 29 Oct 2026 18:05:42 +0900, George Guo wrote:
> run-vmtests.sh -k keeps the test output logs, but vmtest.sh still
> removes its workspace and qemu.serial, losing the guest output needed
> to debug failures.
> 
> Forward -k to vmtest.sh when keeping logs and update the help texts to
> match.
> 
> [...]

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=fixes

[1/1] selftests/liveupdate: Preserve VM workspaces with run-vmtests.sh -k
      commit: 654efa9a6c4c455aca6f034f321c013f5b784157

Best regards,
-- 
Pasha


