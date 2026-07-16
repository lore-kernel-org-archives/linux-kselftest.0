Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033CE3A6EE3
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222409; cv=pass; b=jQM37faDjQzGAAkN1Zim4ubJstyBffSAiIgPPz6Re4lxr98WY/2ijQlLsWDsXDyffrCypr99l1bMi9pyQIbVRpeXlw7QhhvjAVNcEBjDZTh4UshszfhjZG+CG6TvnN+B63wPGarbgqOOPeGQ1jpOhG/l6svovizj4krZ4wxh8RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222409; c=relaxed/simple;
	bh=WgNPTyzJP6h+/loXvXxBK9obj+cvdvHP8r+IDx+BJ1I=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+DZ3NBVnh4ctuQa2TLWPDqqatMh52zoQDO2M8tNX/iTK/wVa7m8s8RkEN8+DFqSMB4iXhRsS+oiYbrlAIE9hI9ApeJQOxAqy3X372KPdvuqipEntgqQ1inNRC3U5XoIDDtr5cUwx421zoT+OXjtMQMvYh5x+GwQrrsUhPdUz6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V5FFJtkQ; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V5FFJtkQ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2309498a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 10:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784222407; cv=none;
        d=google.com; s=arc-20260327;
        b=Y91OwM/zp0DBpsXnVff2ZIEBJJPD73kV5dQpKrps/MDflAbOWasZP2KVgOJbQHKXzt
         yUD6QqMsXcfnGhoDjlR3GKgK6SCIFi0dc+otE+7VkzPasF4bxeHqR0+U1g3WM/xrZRQN
         PzjKTfm8fkgQqOjMBeGB9yQ3Tr1bEFs66ZJ4p8ds2bp9lc0yRnAa+5lz8WXLf+Akg1i2
         CRNd8cnsR+9qrOcHwOpzyZZ5wlMAGJw5tAT1F06vP7muDQE31a86/kKEM9fYwmTTVEN5
         t3lrSvLWG4TVWyvrrtkOZkgypFXxBKZaualTalDAQiNHTwVWGoxX5d09SzLemWsnzx8K
         X6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        fh=GNe9ZBkbTvh7Qhjw75jtxhI517BAfA+6DQCucjroFq4=;
        b=a+s+5wsVVEznZjjIlJLVW1cDW7IfT8EMUknVvussGux56K4R1mhSyLRZeTsin3+K6p
         292NIO21ZXTKZfS7dZMF6j0Yt1XtJRRrw1TLvTdWWq5JtblXX8z4b2XpvqdIOBWKWeYk
         H30Qm4Yes49miNPvmhLyaczEO1jKsAE3rwSxexR3MK0TcfkgniOixlcIzTbA3CmDrjK+
         3DCjSAOhuWtfg/oVACEXdl8J0sh2scdZZYMHNGCKgGj3QlwwdlnbvDsbQvlOyu4zH1cD
         mqYgDK3JLDT+TR9C7Y1MelaIPnkpzPyI2d2Aq3JiJpVc608hJEkBC6ruZ5IEGFQ17kgB
         a/Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784222407; x=1784827207; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        b=V5FFJtkQtJ5Of38LJ1sNYFN6lEt2zSeQlQhqKa7Eztd4arzlzvQYtO5vQms52mDfqW
         stQkSkmY79dewsm9D6RGU0g7NN2THOzuBAMSs0vUHPIpW/kDULG4x8kTaZLXeKjahtET
         hSmaCIzO/vzFMdUWrz9M44vrBs0Fv0XSLP8aSVWYsW+kxT7FnW9bu1b3++B73yUKKlEc
         IZWP4d8IXEcY8zl9qrszxW4PholUJthVAOkvtSrTXrwE/Am8Uxbsjau7q4gh199mfvg5
         PyD+eYQT890r3GNeGACnTDNovfBDuQrxrAcBNcpGGdx/yeSkTWLApNwfql7QSPVYJYfB
         7/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222407; x=1784827207;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDpH4vLaInenlGkSSwc32ERdxUXfDeJnyW2zrivGsV0=;
        b=mFLxI9mNxGEtgN1vAL9qt14lxTMyF66uT4p31IZC2kRue+NZ1Tjuph7Q5+eIxinyfx
         KBAVQDjzhCy66r4LmBeYyh0JkCBrk3V82FD9Zq3qfHppRWNDDGzQxlzj5fKCFqul0oxC
         l0Uy8y33MssvwAEMD+ah1KY6EUOig5BUIaYd+ukH535BCXVrAecUsdZ9/B2RILq8HgRs
         CgqOVADUM6/RTAEyoysYHpChWTCitoqDnY+fGR13lY+31DNyxkKLMFSZvw615gqIrJyo
         LPQNEoTNh2yLa6I393pxFuBa3cS4YAfmq6urtyA8d84HoGP/ZH6fCc7l0yR4f2QX8WGj
         IWHA==
X-Forwarded-Encrypted: i=1; AHgh+RqNVoZ1g1iu//cPZs8TLx4xxCeVK3EbwQiAWpRVtBv9JyraG4TwaqYkx6ZC4Z/cxfINFGpb/a2F5UzrVr3qi/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX26Uy1E32xK5G9WgxCG6ZFelgzvyEkqCgyWhTeE5uftz/++iz
	i8crNwECvmaXrL1dsw6UxVJmoNDV3800BXmKmSs+zZd/H/uJ47cSNxf2hrymU61hSYUFZEXsc67
	i5JzWVO+iJgwOg03TinZziNYwxe7X0OHoa2zq7EZG
X-Gm-Gg: AfdE7cl1pXlTWkTuE46jQxbm3kTuw0S073/vIaKpZYZksxfBlL+ijxX1flzCvlUP/cI
	saL/C15GmvU8Xyzn21pXsJr7eA6uO9YWCjPxT/P172q7L7dsQTuwz4FCRSEt30NNy/dwkHGV5d0
	zF/urbajPRSeUL2aFtqwcNPdzzkN/+4BInsf+dPmSuJmaj0vY4cadFA3+mRMeGa7QRk1W43CXBP
	pjjRLSluALb2gULg88n55WnsCv1gTjTvM2C+F1OxT17uP3cZmBJNW2HSPUR8B1Yt/kV9TGfjMm1
	bYY2f49dsX5EmsuJvFkpzSK/fcAq1MD1Lrl07ne97eG/PJDI
X-Received: by 2002:a05:6a21:7482:b0:3bf:6c08:2b2d with SMTP id
 adf61e73a8af0-3c3a5e7a4fdmr21247637.53.1784222406715; Thu, 16 Jul 2026
 10:20:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 10:20:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 10:20:05 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com> <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 16 Jul 2026 10:20:05 -0700
X-Gm-Features: AUfX_mxBIq-fm92f37AIysrX2Jjvm6RrlF5jRh7Q3ctlrGsM_3yjDZToekOalgI
Message-ID: <CAEvNRgEjPA5pi1RqpQWgp_hH2HmSnGhWaNiXtVBJb_VVdKD7qg@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Introduce function for KVM to check the private/shared status of guest
>            ^
> Nit:       a
>  > memory at a given GFN.
>>

For v9, I added the "a" in the commit messsage body but retained
"Introduce function" in the header (save characters, and make it sound
like a headline).

>>
>> [...snip...]
>>
