Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424051A73A;
	Thu,  1 Oct 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864313; cv=none; b=SJFlL34tF74sEm9K/HpTSoo8UIEbT2IX5+jTZGtvvVeiqJ2KReeiFJS03Rwkx0C2pzjQSGwxNKEoEdQvdE2vveJLz5XipG+Q6pn8cbDOSK+K4Q27lHpjih53liN/390XibqbfNsFGyV2y91h58UQF7Ec90lx0rQCjPEGX6R3NKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864313; c=relaxed/simple;
	bh=bF0Zo2SuQraBYIJ5v1w10yzUFUX4eqnYQL41CyZG1Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=s9z7nNXBvDY/LmTGTgmwLo9k+NfMS0wu+3uWTGuYOM0KrI4EXbjmxBYlFdUdyqgtfo/27OPlR/NkfH6Gula+4HbOQ4iI2XlN5fbx/Ljiyk40AKA+O2QRTmqgadLuhbAQatOqpe3UklY7Mie5r/DljCD6Cmgq5z78FLLSBbelZ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=FPORlZOK; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="FPORlZOK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93FA13ED89;
	Thu,  1 Oct 2026 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1790864303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FyO6LOCavfvkW41vMTq8mkPPmIkVy5QIh9FpKo5+d/c=;
	b=FPORlZOKOOCn6UfuHeGxvuzKbSHzu72g4+MNVdCGTGYG5JaMPBnIcJ2Bw6BSjvuJnvUlcg
	kjaBso3iRTzCP+CMGzcxuemSW8m+BD11GnmS0qKxz8vHbdc0zIt6spOS0QrXYhsfh+0lyN
	052OvTq5KYnE2ZpQRamqzSBNOMSMWEcu2v1vMpwlyFzPxFF3zw3Y6S/ChV9v8I25xkZvys
	thkGcIAcxce3iaIbvMkX6aF8t6VfHK4eADXyaJ4rvoGJTFuonnwfpd40Qb7jBFF5pkDbTo
	otAshxGwOc97MSQnb+AwED9p38i/MJ/Ap9tUv8YgrG8wasHMET4YxTAX+OVerw==
Message-ID: <c5ceb79f-3548-41ba-b1e1-96e5d2f32860@gtucker.io>
Date: Thu, 1 Oct 2026 16:18:22 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE/CFP] Kernel Testing & Dependability Micro-conference at
 LPC 2026 CFP
To: Arisu Tachibana <arisu.tachibana@miraclelinux.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, sashal@kernel.org, kernelci@lists.linux.dev,
 automated-testing@lists.yoctoproject.org
References: <CANgtXuMMvU7TQq8hv-T5NQbA6yfzcAMsFq5sdxXq-VzF+oHYxA@mail.gmail.com>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <CANgtXuMMvU7TQq8hv-T5NQbA6yfzcAMsFq5sdxXq-VzF+oHYxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTFTO7wUx0kPeaHeDSVqPMOTzvvZeMAw/PRd7pwuxCYtT9BbgaDo4q4D8MHWLYo7HpTk0s1iRRF36KXutJ2FAe2fCBurdztavBLW8fsIwlkzlgLpXHQKwJgdKiFwyHdnpaBdBu+APvj79A+jrfVZ+b4doXGq+wdiag+XtElik36RpFK73hJvQbs1YXOYJbWM6OWUWHH3jgxGuFPcn6B9OIPpVn4C/LayACMRVpGD72YKxowqpea0Qya9tV6xIILQRBKrQaeCkBLSNjb+z8tSvsXufUuRS/e01hA+Iuz8TN8pwRhQAUTj3v3SE0V4eBhFCjBobp4Q4OJx4KB6tMY893wRX9Vn19r94R0LF2wrROGX6bnpAKGyzq6rm6MD2K6gOmH/KdXynAF1ssPouLJqGEJGZiQ1VvI/EDtNRYPuOlchU99JFWE9y2kNHcqg6lthcVphIBnLsJ5OA7kt63tOAeQpdMILT1YAyZge3h1Aw8OziBmk05nk0deFLfRViby1hEyN7Q9cOnfMLdFX30LmCh0FGhTE/N6U7qUM+0SI2IX6yza81b5yJczXnEfoB0EXOde1u61Cexs0QTiccRBYZVUv0E+dDpy5O196zXngaoQDnjphEDPuZoG7qoAFPegTox+SxlqGFxGm2ZJghSWeGZowuRbFhZoeD71W+PidrQCtSw
X-GND-State: clean

On 17/07/2026 05:04, Arisu Tachibana wrote:
> Hello everyone,
> 
> We are pleased to announce that the Kernel Testing & Dependability
> Micro-Conference has been accepted for Linux Plumbers 2026!
> You can read more about our track here:
> https://lpc.events/event/20/contributions/2328/
> 
> Our Call for Proposals (CFP) is currently open.
> This is a quick reminder to please get your submissions in by 11:59 PM
> UTC on Saturday, August 7, 2026.
> 
> We highly encourage you to send your submissions as soon as possible
> to ensure you have a chance to get into preregistration!
> 
> You can submit your proposals here: https://lpc.events/event/20/abstracts/

Thanks to everyone who sent a proposal.  Plumbers is next week!

The Testing MC is on the Tuesday afternoon, here's the full
schedule with a wide variety of topics this year:

  https://lpc.events/event/20/sessions/259/

See you in Prague.

Best wishes,
Guillaume

> Thanks,
> Arisu, Guillaume, Shuah, and Sasha
> 

