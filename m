Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B440C8F7D;
	Sat, 24 Jan 2026 01:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769217552; cv=none; b=KdK72hEwu3/l5ftyo4DHY7prOuJ+fmgGra5cwh7WJaSpLPf5qDcSvo45BhDKWLCvN0Z1YMPgIeYEw8ccWNiSdKG4Cf2qdYy64op779V0zXFF421EPx14hkCwCXRiZ8xnGDpwPV8FsZ9Om1lKSOTDRkJdp0EOeAtdUzY9KdkZLd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769217552; c=relaxed/simple;
	bh=ubp/0G9u3V+p2FlbYNM/Yg2Iw9JZsdFTz1gPz91iJAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKmDpSzxA++Jfr2shNVZOeE/VQkevbzICcxu1WGHZxdRn1wrDJszumOZGzZp5F6NhxkLqlefMZwRkiH3FyhsOT2OBTt7gECI7WBTf3+Iv1Y3pEWssiWYOhhay31Wq9+MM6IbDGewEiDnQbd+nFoOEOheFb0yWccVBsNgDA/Gbn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=dgRqYXTQ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="dgRqYXTQ"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60O1IPsF1231574
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 23 Jan 2026 17:18:41 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60O1IPsF1231574
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1769217522;
	bh=FdHvqqEgWPRzA+LPQz+EkBCwJLvpVV6aVG6J4c6OcGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dgRqYXTQb659NNbm0S0Uyvuksyl8a0rnH1at9vhcG9ngXs5dQ/aWGuxNypCq/hh1j
	 hSNaKHgN06d5ek7qXdx7U/jF7hMciRpj0k/P+VMCbKzp1MyNceasZlm12nFiDeR/62
	 653PsbubQlJe3gO3Nv+7X4p0gT0qHMHJxzQrU/jOZWI24itFObuNeowTS05LWRmYWA
	 SRVkUxzCIiOt2tSr+i7tHjA2BCFB+x7FB6K49VS9yeAjl3RtPfjncsaRr/vQ8MiEc8
	 9q9AFSI9Ok2XpkCrxls/OzLg76wlt0V9oHZjuSo6D/A7XnlAigAxwzcv9vCXXz99IR
	 nP8kU2nj0JROg==
Message-ID: <e5fa1ad5-afa0-4ba2-a60a-d43a2c6e86e5@zytor.com>
Date: Fri, 23 Jan 2026 17:18:20 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] selftests/x86: Skip int80 if not supported
To: =?UTF-8?Q?S=C5=82awomir_Rosek?= <srosek@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>
Cc: Betty Zhou <bettyzhou@google.com>, Wake Liu <wakel@google.com>,
        Kazuhiro Inaba <kinaba@google.com>, Jeff Xu <jeffxu@google.com>,
        Alistair Delva <adelva@google.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20251217135932.3153847-1-srosek@google.com>
 <CAF3aWvHbSgDYxgFHF05FkEGQncMUXsuwMPDBCcoXUGoQgESuEg@mail.gmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAF3aWvHbSgDYxgFHF05FkEGQncMUXsuwMPDBCcoXUGoQgESuEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026-01-12 03:23, Sławomir Rosek wrote:
> On Wed, Dec 17, 2025 at 2:59 PM Slawomir Rosek <srosek@google.com> wrote:
>>
>> The IA32 Emulation support can be either removed from the kernel,
>> disabled by default or disabled at runtime. Some of x86 selftests
>> are crashing for all of above thus is_32bit_syscall_supported()
>> helper is added to skip int80 syscalls if they are not supported.
>>
>> Slawomir Rosek (2):
>>   selftests/x86/ldt_gdt: Skip int80 if not supported
>>   selftests/x86/ptrace_syscall: Skip int80 if not supported
> 
> Hi all,
> 
> Just a gentle reminder, it would be really great if someone could take
> a look. Thanks in advance.

I think grepping the configuration and cmdline files is definitely not the way
to go.

For a solution that works on existing kernels, trapping SIGSEGV and calling
int $0x80 is probably the best way to probe.

	-hpa

