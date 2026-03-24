Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86432313E29;
	Tue, 24 Mar 2026 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367305; cv=none; b=GAJ5sXZ27LAHXSp9u9KyQ/0ygavghObm6D5waFt8VLPDExxkTPHNnMfyJ0yj8Vn1wI6R93j8KY+XhYftGwBSxb/uYv1ruUhxsEbf/5iXU5hMH+7zMAMlXp/it1rQPQRWaW+s4otbYHfFEEpQFsbL7hdrjCZeN3PCNlAyZzQy7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367305; c=relaxed/simple;
	bh=gTpmcN2spsGA1JJt5Rk56bbdXNRB9aMPTaKPb2ATdko=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ecDac2MHWKxJXB6TXxXmB8kaWtO9hUqEH47ovAjTWzJCSamMrdJ+z/0/3Z4+hlbcVMegGUumeVh8f0TN2FFQ+g1oP2fgE/Di7c/MPyRSTQfEyyP80qDpflAmWnyZWsJBBM0SzwZ3/BatXIvt9E8sSUaAo4dko91+5+vDmeh3XOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=nIaHoy8K; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="nIaHoy8K"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62OFG9f1754165
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 24 Mar 2026 08:16:09 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62OFG9f1754165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774365370;
	bh=gTpmcN2spsGA1JJt5Rk56bbdXNRB9aMPTaKPb2ATdko=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=nIaHoy8K34d27ip37NmjnN9YZ/SILCk3yZwx8Ezx7O4hCwGBRRxvpH9xc+wz2mClV
	 qZevuzC6KhRxpLBu2wjMXE/bTG4unih7zhsafyxxqQrTvZV9euMKIkxLoUFtTwoYrO
	 rjaZSdacb8BE/S+tm8NgmX3ATnhoAHgJ2Tx9AGBYoS/z/smoJWx1sUUfNiiTDE+93J
	 Nnz4AKpYchcQFddnA/RVoK3Nyql10Ymmw3dcxd85FJP4pX/4NJmgkFSv7QJ7Akp8A5
	 wGzrBfFwhn8fiNAZsTIzfk1H2Ss9GjzCvEuqqY5lf6L9kC2wR0FKKJGo9jBrR1e85X
	 RmlGrAP2meDxg==
Date: Tue, 24 Mar 2026 08:16:02 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        "Lai, Yi" <yi1.lai@linux.intel.com>, Xin Li <xin@zytor.com>
CC: Dave Hansen <dave.hansen@intel.com>, yi1.lai@intel.com, bp@alien8.de,
        dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
        shuah@kernel.org, tglx@kernel.org, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_selftests/x86=3A_Fix_sysret?=
 =?US-ASCII?Q?=5Frip_assertion_failure_on_FRED_systems?=
User-Agent: K-9 Mail for Android
In-Reply-To: <098e3877-5681-499a-b8ce-dbf5c78847fb@citrix.com>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com> <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com> <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com> <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com> <acDYXtVgSKbbAuGs@ly-workstation> <ce764071-6670-41a2-923a-88f1cd04b238@zytor.com> <c2979413-62f4-4a35-ad64-be2b8f55ea04@citrix.com> <0200a8d8-6871-4ff2-8c6a-968c2cb39a4f@zytor.com> <f55dd646-c728-4b0e-ab3e-18da8ac9e6e2@citrix.com> <760478B2-AED7-44F5-A22E-1730A9A0ED63@zytor.com> <098e3877-5681-499a-b8ce-dbf5c78847fb@citrix.com>
Message-ID: <CEB24B01-3C92-4C5C-A3E2-D4A265370559@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 24, 2026 7:46:26 AM PDT, Andrew Cooper <andrew=2Ecooper3@citrix=2E=
com> wrote:
>On 24/03/2026 2:33 pm, H=2E Peter Anvin wrote:
>> On March 24, 2026 7:08:14 AM PDT, Andrew Cooper <andrew=2Ecooper3@citri=
x=2Ecom> wrote:
>>> On 23/03/2026 8:27 pm, H=2E Peter Anvin wrote:
>>>> On 2026-03-23 12:17, Andrew Cooper wrote:
>>>>> This doesn't really test whether FRED is active=2E=C2=A0 It tests wh=
ether the
>>>>> OS is not providing strict backwards compatibility, and I think will
>>>>> malfunction when there's a hypervisor above Linux providing strict
>>>>> backwards compatibility=2E
>>>>>
>>>> But that applies equally to IRET, no? If the hypervisor clobbers the =
segment
>>>> selector like IRET would in the interest of compatibility then you ha=
ve the
>>>> same issue=2E
>>> I suppose=2E=C2=A0 I for one don't care to provide that level of compa=
tibility=2E
>>>
>>> But for SYSCALL, what are Linux's plans for CRIU or RR ?=C2=A0 I had t=
o fix
>>> SYSCALL legacy behaviour in Xen for the following case:
>>>
>>> * PV guest issues SYSCALL on FRED system=2E=C2=A0 %rcx/%r11 not clobbe=
red
>>> * Migrate to a non-FRED system
>>> * Xen uses a real SYSRET instruction to resume execution
>>>
>>>
>>> Here, the guest continues executing at whichever dead variable is in %=
rcx=2E
>>>
>>> CRIU/RR won't be exactly the same, but will suffer the same class of
>>> problem when moving between FRED and non-FRED systems=2E
>>>
>>> ~Andrew
>> "Doctor, it hurts when I PV?"
>
>I'm asking straight up, what is Linux doing to fix this same issue for
>CRIU/RR?
>
>~Andrew
>
>P=2ES=2E=C2=A0 It's rhetorical, seeing as it's taken between Linux 6=2E9 =
and now (2
>whole years) for anyone to even run the x86 selftests on a FRED system=2E

That's not true, and in fact *this exact bug was fixed once already*; appa=
rently someone "fixed the fix?"

I'm well and truly confused by it=2E
