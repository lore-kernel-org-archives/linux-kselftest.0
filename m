Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380C4A206F;
	Thu, 15 Oct 2026 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071843; cv=none; b=XZ2PFWQcPm5lyK26M873t0Frmy+vy4dLvdwP0MNPfCA+aS62pGCFQgwoar/2goZW+PmHPHYsXNC1bbZDuPbd0mymAnNVSaRcJVWkqKYcK9E2vIVBdPwc2IV0QmNq+eNDAcM3E7epqIjbD4xQnaE6TfZeXju3XdCrj32P/REN0vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071843; c=relaxed/simple;
	bh=p6ELrmae6qI9vb1c7UWuKd4wsKeLvtU/xgInuHBF/dE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UlqY5XdgsIzkB3J82UOR3yH1yMAqAxJmQhCoUVKlV3kbHWvPGVxtaZ6ZTDHnifipiOYGiU2pV7DkxEfnTfP4IBFj/ebJYzChbm/r/HylP2g9xsd+4m1s9hycMbUssMqO0JeaV3bVBYBfUS2/CYJGDUws7JMEf7nvfjwetJ1t9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exGXaKVB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exGXaKVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3F21F000C4;
	Thu, 15 Oct 2026 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071842;
	bh=I2p+U5+wUh22N+M/aKWINw3olgc5ack8LcssI64gIEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=exGXaKVBAvRgexBQ/j+3luClBUh4HWab4IeJnWLhL/T0H+Y1azArlmYT+dpTn4lu8
	 x+gr/9z6swgjBRgc2ZY6nZVGn7nr21uwebXV6z+VmSrm04Jd067qww7PMGdlSGoTLx
	 irTR4HKsIsL+XVyyKNxid4eLp1e84A5390GXxUHkLg60TcDtTmL/39K0SO2F7ISkaZ
	 R8jfq1pLLCks+r4+ALybXiFI+jgoDY/ra8xlMwgoirXb1or+0i6xQfKptTDXeXDE+q
	 Sq/MGy+5TuTK6m5YAxzwc9C8taRfAlUKxZ3W3GRpwzuw17G4lKjIhkUahwu8eme6Ea
	 EbwptDdkNvzHg==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Andy
 Lutomirski
 <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah
 Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 2/3] vdso/gettimeofday: Add support for
 CLOCK_BOOTTIME_ALARM
In-Reply-To: <20260929-vdso-alarm-clocks-v2-2-a7af4089a698@weissschuh.net>
References: <20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net>
 <20260929-vdso-alarm-clocks-v2-2-a7af4089a698@weissschuh.net>
Date: Thu, 15 Oct 2026 15:43:59 +0200
Message-ID: <87ld7zdqow.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29 2026 at 22:24, Thomas Wei=C3=9Fschuh wrote:

> CLOCK_BOOTTIME_ALARM behaves exactly as CLOCK_BOOTTIME as far as the
> vDSO is concerned. The vDSO library can handle it automatically
> correctly. Only the basetime needs to be maintained during the tick.
>
> The namespace offset is already set correctly, although it was not
> used before.
>
> Reuse the CLOCK_BOOTTIME basetime for CLOCK_BOOTTIME_ALARM and update
> the userspace hres clock mask to include CLOCK_BOOTTIME_ALARM.

It behaves the same way, but ALARM clock IDs require a RTC device. See
alarm_clock_get_timespec().

So the VDSO and the syscall will disagree when there is no RTC
available...

Thanks,

        tglx
