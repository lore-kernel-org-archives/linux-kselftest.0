Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06ED346AC2
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 03:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784257479; cv=pass; b=Rz3FXHJuakmmcBeaGd0kWBRFIYJKSjtxIqGH5gllRMIeUQ5c/eJHzz2MbW2P62In3XQCZIKdAWkQHhlp2RbZnpMdSJRmC5uVz3GKKu1sVufOK+Mx/2JtuKGagVOMTsO6iYF9gB8CXxR5JYF+KhSP1MrvaHVdRC3aqxPymKPsO78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784257479; c=relaxed/simple;
	bh=mqr1eGjgaNl5lAckcXfTGIgqynq/owkMRJ4M/3PH4Vs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Jt3VC09kpA2VzQRfNrxEvZ6VnCNla8/sN+bey+SRkBqjScM9tVvuJdR1r8yB8sBNC32aVm+avCHphmZl/xJOiAVc5iL66F9g4qpudX9MbIdB5SLXoI5NrZaHtwkZHSYnxUKTr6FKdAzNbhpvCqQeMmKGHAUkcMqfje87lkp8Eoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20251104.gappssmtp.com header.i=@miraclelinux-com.20251104.gappssmtp.com header.b=pbv+ZN/z; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20251104.gappssmtp.com header.i=@miraclelinux-com.20251104.gappssmtp.com header.b="pbv+ZN/z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so7168431b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 20:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784257477; cv=none;
        d=google.com; s=arc-20260327;
        b=ViGpJQulYwEUGNhL4Xv0r4fjfZ95ZV4SChFFdrZ3r48m2bK2lrZD2iayn+mhL4X+hG
         W+h+Mt8KMtSV9ur9Qx584rJVsvs/Py3UOewTn5hcNOAiin2oRB0ZUKtTam87cXPTGJxh
         cdnqPTi7DNM4uju2INSkob7nMskfhDCgWBZk+KVHmMHoMgIjr8btrzYczMlGx+rf5CBx
         361tuIR0zjsXQK+ByF2fE4qT3U+YDU7NrAC3JApGnXYCAxMSU8yHrldIIWwVZ2vAfDMi
         Uso0eT178luuuBgTBaIBfA2nEFOfARhCI9yyzd6qHK75LkNRLCvvSXvWS4FB0LYPInWw
         dxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mqr1eGjgaNl5lAckcXfTGIgqynq/owkMRJ4M/3PH4Vs=;
        fh=oxPvV09XT76l13QaTO58cD4CgV/vDj1v1/nIwzm8kQE=;
        b=GljZujeuUfKz8fjWEpEe80OfIKImgcCnDqF1GfeHMyB9UdSaFijnh3z9HQv28JvphN
         p9Tq6mSUTrcOQzv8RN1SkBFPjui2si7fVywfEtSLhzBKK6u8lt781XzSXeToYnPAOmus
         1QhIFc7oz57ESh3cjiNLuvzRvVN4GtN/tOhsyxIZuUMnf3RO1vIgPpme5vxdtDLhCnB+
         9vO3MRIxY0E8eeT7QkaUI8WGsOUE4NKNHoGuGOt5xBvVgkBbe/WPIPzRV1xckv7cPVHr
         1ngznHzbD2zywqywqg8/Sg3mSwUX6kcA8TJIUBDZz3Uq1JfMatqCuBdhTC9TXqXdgDzG
         oiSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20251104.gappssmtp.com; s=20251104; t=1784257477; x=1784862277; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mqr1eGjgaNl5lAckcXfTGIgqynq/owkMRJ4M/3PH4Vs=;
        b=pbv+ZN/zWYNNNHOUglfkdf5frtLtJb0B8EpBJ4v/hNLBcvIuA/RarYu1U/RTSQgc+x
         xBNNu14mwqorsj4uqPayhDGxWuOsV9DOZzbBQg9Zpb9RdxRvo2C37JZofFh+XZGr9RVH
         5FdBd1oXdGm6JKc5T1aT9RRGl5fDO8TT0yrBgmYnOrojVzXVBXD0/4itrzMpXbH+Yk60
         /O2YEyRh9kWGHRXzcH9B1kaSokkgcPjISfsBvIDXH44HiZxUAQ1NNFCc/jcUGrCEoFQU
         auN0D/+0pnpll++tX5O4GlIRFUO+0/Lpk18Dq6m1pHhAya+EAhHDhy84TuLJZbRxf93x
         oJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784257477; x=1784862277;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqr1eGjgaNl5lAckcXfTGIgqynq/owkMRJ4M/3PH4Vs=;
        b=HuYj6My/NMcwFi6NbyvSqAQ2s6yDxnWllDkomTISTQeMYUISCqgQ+2sBD6QwHi9/yA
         YgdK5Dm4L0a3txJ3NRwTTpxTOQaxUnHZtmmKJl+JpLS3uqoBy78AbndRyzH3kW0/XyFk
         ImWwPNvmmuusf8K4i0GYoc/70Ela0l81jUKGS0xiL3eYpFAkOApxvznH/WjBUcaUK8fD
         j/JVOat0Cs1iT9iixsFX0rjx0IGkjn2rL+XipIirL10lT8USt9gyw28057a+PhytnJnH
         ek633choH8Efu+aKBIC/wLGaBsf9aeBpXdvDXkZ2I0at3lrKvn7GYk9D8aAWGCI/BGVK
         MU4w==
X-Gm-Message-State: AOJu0YymKAjwsqggC9EDF8ScxDttWYKSWcylrvQOr6bQiz32rD2j9Zrv
	G/KgFkEXD5K62/xumqjh0qR45VycIUoGc0ALYQ0UgRSpLkQWthha7s7ujIzwXvgnKKS5GNDTWnH
	9BY6mrumIGYefklZnH1fqK/fl9Y56ig2E1QEIReZ++EcbE2yTWaydoF4h
X-Gm-Gg: AfdE7ckd0FQvYkqtFFmefix5vHCihNZIAwoOgCwjF0rAR458uEDsrBGfT5RQ5eNpVg+
	UVDATYtpMdvAB6lOv8AQ4I7KsyI3Nn2lTxozEJYWiZ3dhlooOLAfunVsdSfINVyvzkymPgcIFvR
	bq++J562GNOBGnZlTTopQrZuEfJfCAfIwPhM9k830+JweHBppniLnA9E5bGDKR4UxgNUEqxGuRN
	XHLm8JiTkOklTVygg2gwvHLf6ODISEUP8cFHPoUgT/IBiXmRUVk+pI77k3ZCg==
X-Received: by 2002:a05:6a00:2302:b0:848:89ee:9de6 with SMTP id
 d2e1a72fcca58-84c29501a3amr638961b3a.58.1784257477201; Thu, 16 Jul 2026
 20:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Fri, 17 Jul 2026 12:04:00 +0900
X-Gm-Features: AUfX_mwxk1uxGEfezceKWzAJsj6gE6-YUKbhLsKern7QuPulS8RkTY_CSUcc-cY
Message-ID: <CANgtXuMMvU7TQq8hv-T5NQbA6yfzcAMsFq5sdxXq-VzF+oHYxA@mail.gmail.com>
Subject: [ANNOUNCE/CFP] Kernel Testing & Dependability Micro-conference at LPC
 2026 CFP
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, gtucker@gtucker.io, sashal@kernel.org, 
	kernelci@lists.linux.dev, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

We are pleased to announce that the Kernel Testing & Dependability
Micro-Conference has been accepted for Linux Plumbers 2026!
You can read more about our track here:
https://lpc.events/event/20/contributions/2328/

Our Call for Proposals (CFP) is currently open.
This is a quick reminder to please get your submissions in by 11:59 PM
UTC on Saturday, August 7, 2026.

We highly encourage you to send your submissions as soon as possible
to ensure you have a chance to get into preregistration!

You can submit your proposals here: https://lpc.events/event/20/abstracts/

Thanks,
Arisu, Guillaume, Shuah, and Sasha
