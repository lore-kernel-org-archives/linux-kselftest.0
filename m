Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478003FFFB3
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 16:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849975; cv=none; b=XUZ464TtGJ99BNztgklNl+8Zb6Qg76P7yhCC9QK3DD9R10eM+nhTM6ayBhoBdD4JkbnaNj8WrNh9beRTBZANIMk5Lp1g3A7FLfbCndmPOPATHkyWUCD0Ld7C2a6vp2fcv3AFJWNoau2zLJBmAKZlK0GjQm9ySCW+k2EPoWWmODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849975; c=relaxed/simple;
	bh=g44yd/hweVFdZ2tdpXc5nNvC9GyyPylCXjjvYMZpNQ8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=U10sBhsCFCv4r2dm9tvNIAAPGguGyb2tNGFe3Ze1/bwAXb7FlDDFp1j1Yb4YMEd5e3F0Bh2tFj+yQ6NJEWf6ZpP4Co22r3ISUTLAfhkW9jA8Qycuivylu8UfXJCqSHME7rf4fPVAhwBPxuLLCe5nyZmrI7FJuTI0o1Jhcm0tmj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JJIWKSU3; arc=none smtp.client-ip=91.218.175.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JJIWKSU3"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g44yd/hweVFdZ2tdpXc5nNvC9GyyPylCXjjvYMZpNQ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787849971; v=1; x=1788454771;
 b=JJIWKSU3wPXkKOliZEhMd2ETQUEShCmsOSKakU3F+XYrL4hGvnB/L1G0eqTYajjGNvqNKR7I
 G6xsSAyTcMLpNfWrTE/LHpq+ZLclZaaPTRv8q/yDHGihog+A69MrUq7jtRoX7v+Sv2/D3OLXr4u
 2bxIJ+l1aQYiYPCDC+DjOfSc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cde2c297ff49e951;
	Thu, 27 Aug 2026 16:59:31 +0000
X-Mizu-Trace-ID: cde2c297ff49e951
X-Migadu-Flow: FLOW_OUT
Message-ID: <542d7a2c-a435-4b0c-b860-42e2209eac3a@linux.dev>
Date: Thu, 27 Aug 2026 09:59:18 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v7 0/9] bpf: add support for KASAN checks in
 JITed programs
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Yafang Shao <laoar.shao@gmail.com>
Cc: ebpf@linuxfoundation.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260822-kasan-v7-0-99afee6ef7fd@bootlin.com>
 <DKWOY12R4ZJJ.A8KDS1DU1PHS@gmail.com>
 <1c34603a-9170-4074-b826-e98d9871e2d8@linux.dev>
 <DKZJ7GFLAU12.1WHACTBREQQV2@bootlin.com>
 <a96f8530-114d-491d-9802-83d72dfab16e@linux.dev>
Content-Language: en-US
In-Reply-To: <a96f8530-114d-491d-9802-83d72dfab16e@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-08-27 9:56 a.m., Ihor Solodrai wrote:
> On 2026-08-27 12:01 a.m., Alexis Lothoré wrote:
>>
>>  [...]
>>
>> If despite the comment above, teaching check-kernel-splat.sh how to
>> ignore the kasan selftests specific splats remains a better solution,
>> sure, I can work on this.
> 
> No need. Let's do the SPLAT_ALLOWLIST, I'll take a look at your CI PR
> shortly.

Sorry, I assumed it's already there.
Please submit one to kernel-patches/vmtest whenever you get a chance.

Thanks you!

> 
>>
>> Thanks,
>>
>> Alexis
>>
> 

