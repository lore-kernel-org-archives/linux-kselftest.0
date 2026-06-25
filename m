Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F791F3B8A
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 00:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782346774; cv=pass; b=uoRYn1gjFXZ0YTdawWv9K+pB9VYJEnRN79aHive+xBYDCN76TfOTYkLtdME/sUsOYRx3Fg4jG94/3QtYhWWo2M5HEOSAEJbFdK4tGPYJ94ZI4J8YWzvktS9uuw5dR0rRYHNxbT2TH//T585r/IpFBtB3HHh6lg0NLanD86ve5WA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782346774; c=relaxed/simple;
	bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L32lPJCOecamtofPQmL38aOzoXaQhTkhewV31vKahL1QK2nYhv44IrfMDmMlzmYGQtAwilRVZqB3X4xKJ3kfk8dtCFQjsZGgVmdIPC8pcLcLEmkrlwZpdEO3oKbbnLcH5bSp1NW/4HJ4kHl7dFVzLtP2vj08ap+2qwPsVU9xbMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l6O4rAJ7; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l6O4rAJ7"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-139a71baa35so4345385c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 17:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782346772; cv=none;
        d=google.com; s=arc-20260327;
        b=CieYV7Gm0xozaPZdJ7oiMrwSKNgWVk9fZyMNLt03QdkBUFENMjLJXQ2rargldMZJUt
         CH88gvd/17s3Nnppo6yq6UmbHy9EBdGNYg5521eRNdh2skrvAagLSmNrKwB/BcFgrH5g
         boh80L+vKIdbzCTDUTynDdjhBFJF32VxQin30L4bbLDQVpF2pZ6hzeGaf8AK/dgetHsR
         iFMW7OrmziWw024VR3MGbQpk5FGqCmAssrhmo4hE7VrXrN4a2OuPIbZd2dv+T0XBV4uz
         hJU3JrPqyN4fegMEqgSS/pBlYjUBNA1/OEdZ24zG9Hj4vS71Q+i2JZpekDXX3DKggE3R
         alfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        fh=IEy1hZjC02xSAoy8fJQC7BXshw9Q6JI3W0+SkvL4gj8=;
        b=HLjyC+u4r6+UkPl9e6NrxvjvI3lJtsn/i8I0KdYVoS3XIVeip7cjK+3x+rI6pbZoqR
         ir23PYkWA/ReBbmyd9/VFNAV+W1VG9VzMY8WSqBmj3/oiTY+gAOrJOOLtLxapaoz7S9n
         d/+UQpduamJsA76sejcSwoFhToAf4hESA9oZCiFRgx9OelLefG2tAelEwiKSM6Kj6ULE
         S8CBed1d2hvvdK1tYj7yF+IlQLS+nIo82cLSrJeowiQ2CgPLVXAOIR4jiVI2z8UKAbzu
         ETEImOQfiPaTgA9wrySNFoDu83aiZ/bZBM3ING9fvJ3A/iDEd7DOVrdljntBsgg9JqM0
         03IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782346772; x=1782951572; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        b=l6O4rAJ7BuSElLvSVCjIBLBDcAro2phzO2UoQrwN6+H320mWttnof0i0/lcdgnC9VF
         c9y5WMcG61fE+olfR6gSw8h/vck5HyRGv9OPpvaKvk4dYSiidvvra5Rw9W4ei3WZz5cG
         UDcca5AyuQDRs00QKgdFarXvgscmMWiwFpV2z3nzvCLhch/PKdQuVbStjrT36He7sJ9P
         GhEfxTfvYFKtGxEsKC5xmX7Uv8xQVPMpOur4cPG36WuKyLxOA+L0ckKRLWa8UjYesS6B
         aVZHb21d4C76/LlYbQQRhBVZFjX4vQ965Jjr84Kc0tAN2qbTazomJ5RHU9u9L8RNh6sT
         pxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346772; x=1782951572;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        b=TFBl06gBhTD/VSliWOjCa9ZFE0rYQDqKLlvuymoYFiimgRJoiRRSFGWOA9dLRt2dM7
         orLkX4AdovVvao9V+7UJ01PCfx680TT88prx2wHMiaGNQ+olOkVXsXhdYXtWJzLyaMT+
         l3S4PLFWrLuN2agFwkq6KBtN7vQz8CYHVPKwxdq97u0ery6DO+5wYXwv95aLTimTvSUD
         t1zy1C0uTJv+7V1RbZR1zROhh/U0SRTXyPG2aVX3L98pnLCzYCv4NO98flByMgk49yo/
         ydhNZRsUeHBx+teNe5LyHQitHa5BfR5XV/qpt2C+BksZN+bu2Eb10M1CUX82a9k2OXVf
         iN0A==
X-Forwarded-Encrypted: i=1; AFNElJ835cqCWTfV7My3Wp4Eei65ry9cXIrOBHLbyIpLXE5w8+JskSlb013cd0H0rRKVUzp434Y9GVd4ZrrDIy5B4nM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhO/DyujC0KgSWH+m2orFD1fB2y4KHCCoofEKI2WjwUHJBi2V
	MS1xAtpyr7KzbBNYhySw2xAYTSeQvP8efs947zCmupNryyo2z/jwm2SCQMmpP4kCcJcUDGI5edq
	fFy8/PhcnEd6Ay4jHbm1LLMu2GiVeY1azT8XFvmsh
X-Gm-Gg: AfdE7cki990CFp5ib6KtbOaoTAyebBgpgmbELIyWXQRMm98XFLGPuZBLmGtyAQfAQ1+
	ymOgGPvLw4yff8V9HdSSSHEM2GzSDsXR/xjjgV26AJwgbSS6EI4j2T2Z4V+S8pMcT5NpOCobKN1
	UhNYoe43uAyi9UC0AFgejdWSMQU6wZRxVyYg391FqutHclFR8zGW19cYbMeMdo5Uw0SUUvEO6SW
	W/q0Z96EqwUwY6rrsPDS+uAPQtsSHXu1GZX+lLN/X5kj2ve3lzjG5HVg0A7K3GLSdQfzWs/S0Ql
	uorDSReTHacTF1l2dP5ahZpwVsA9PPiUZsHBK5GbfYbKR3IWHdX2FljGBoE=
X-Received: by 2002:a05:7022:fd05:b0:12a:b39a:339f with SMTP id
 a92af1059eb24-139dbab1be2mr235748c88.21.1782346771178; Wed, 24 Jun 2026
 17:19:31 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:29 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a6373206-60b6-454c-9aa9-9d52f9d84de3@amd.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <a6373206-60b6-454c-9aa9-9d52f9d84de3@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:19:29 -0700
X-Gm-Features: AVVi8CeipeAcfAxYa6j2yQPCcdB9pyHrAKYmhFznoyz3FS_QiklRPL3N5ubFoHk
Message-ID: <CAEvNRgFUru5GEM7g6Z7nuaqQK2iFmW3w2dPYEKPuehkdGvP2yg@mail.gmail.com>
Subject: Re: [PATCH v8 00/46] guest_memfd: In-place conversion support
To: "Garg, Shivank" <shivankg@amd.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Garg, Shivank" <shivankg@amd.com> writes:

>
> [...snip...]
>
>
> Hi,
>
> Thanks for this series.
>
> [...snip...]
>
>
> Tested-by: Shivank Garg <shivankg@amd.com>

Thanks for testing!

>
> Best regards,
> Shivank
