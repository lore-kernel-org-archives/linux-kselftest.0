Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F058C3D524B
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366979; cv=none; b=ey4JEUmUYhlVLB80U2UzqWZkv6XqbdEk+V7DpG5H2/hP8WWiwWoTUtl6coikgpPjzySsWYJcwHJiKvD4c8Y5Hx5QkQklmmdsjJQrvO+5tTHISb/bi4+8OnVADeTFpGc+blwGmxR6jfspdv1VVCWwcOliTwIQL1ZmRvJ2IDFgaAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366979; c=relaxed/simple;
	bh=uJWKKIto+eGw/Y8Qn5mFfXiI77w3A5Y0n2+GfY+7Hqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJfn1k9XIi40fn9vY8R79CE2S8j2ivanReafPwUtU9nwA9tZ8kGl+Hvt9Nr2wxYFJU7lWfRkW6aENAM231O8hKWl+mozWpaoyVN7ntlJquQSyLbGM+yctYz4/nOQG424HWOeHxOIwXtBRSUHOOE2RHcnOwzOMWUeJiTu0BUN1Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=KDSGlPfN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="KDSGlPfN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-449cdc12a8aso800171f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779366975; x=1779971775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zv2DG/vKNY6iKYozQd3io+YpWsjZ5YJkp1OxFatMD2k=;
        b=KDSGlPfNt55MLmWI5QMvXmYxfaST28x3I9ulkgLhEUYYjj08kfH8575Hvy5GL4n+vo
         LOJLqwI7K3zrHOS0S15BgvN3CO0bd61PZ5+i1myo7nrmLLophJvbVQXIc2q13Iju7u0E
         aRrTgllYpDbdjUdJbH5IlMtP3A+gwpRM8QqbY9cQMgT0D/Hs5ug2OEL/yr4ZjjcNwrwL
         O0b9V7hPzBX9Yu8bI3hg7+INnQnrZSXYDcM74rKrHqxy9dn08idnqclC3dGBBDA0N2Uw
         zsxU+I/wKUTDNaH3+oi4zSCtFJf00s1ewFPHdTN+UrI08IdQi9tiEXPeNC6HkFPoYTwA
         5Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366975; x=1779971775;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv2DG/vKNY6iKYozQd3io+YpWsjZ5YJkp1OxFatMD2k=;
        b=esMp3/aW+Uza2FB3x6aHJ/vON1RgMfLXC+g+hxTSl8SKkcDzRI2xr4k+MAPXJwamOB
         c+oW6keNkwCn4vNFYtbsou4MJU7nM3ki1YC2lNj5bTgXSgfhXrIOp8RS3FydgC1QWCtg
         2eymwM/2W6+Mx9shK69obdfdysaSTCEQB4sUoTjxvd1Z1QEMUiCF2TNdS/eYrwy3gdBH
         w5tWzXKozbQonXSlDTKQmmJLFNdfDOR9C6a+cxVsRgM1wE0EjMHUkenzIHuIovrZlxQC
         cwRhQNG1lNxjUbYawaHoE3rHID/KCXpYuSvXhyW0J0yjqDoxovjAkeg59aJFOjGyqjxk
         7kmA==
X-Forwarded-Encrypted: i=1; AFNElJ86N42wFrDtBAp8Z6pCbvmPHkX0Rw6oJYczHGgVrm+uwxaOtOd7w9qcHNBHNjQzqVsFloDsJpfNzl9fF3//ApU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGfFeqEVeb57y0LndbK4Zt1BzrXRftn381bW84k7Mdpc1PEtBX
	ctBt1dUws+at0x5Csi7wFUVAfFsLJkSgfMhLOcM4gM1JcD/uu9euaVPTyhYqeFYCMog=
X-Gm-Gg: Acq92OF5Sn3olsH8Rh+NzNjpQ/1lxtzvlQ1I00P2iq4dB2z0iZmJ/6kAUHjSAQcD7QW
	HWizSmg5V6uSFWJW67+xeGaB+3A4U5kJT2BZEYUXbNr37s7j7ZVzmgllkkUKBX9lXaxyy7C1PTW
	jgcuPNv6AoPvkCcgj0zyhWgfnCx7R5soYM+8adnBEZP7cC43lCPWvQ6Jzbc1xaZei3behM9cZ4h
	Uirj+oIhc1lGSQBg0Hjz2n4bn9jZSXRvaPcfX30ix7OtCBfAd3hkznx0JUA98QptwYkWl/DJiTT
	XUWCimKZgXBiggi+tciUluXBaY7+c2XKiUe5MHCrqO4QklAxHyQ4xOmBA7bI0RZnNpiCPZhHfD8
	dcsTRw7zxQLFNdqDU0+w/L1vWTzcUhMefuuNTQ1V30qvoaLLmMgI9Xh6zwJifyNswPOZeZx8gSa
	4HpBg7DdudHycFBqeLkND5CuD9C+4c+bnDJLi2tmTZYR0oRy2u622uEYinKx9qBR4O41oOEXuIS
	b1/
X-Received: by 2002:a05:6000:389:b0:451:b39:a206 with SMTP id ffacd0b85a97d-45ea3cef56dmr1551400f8f.6.1779366974045;
        Thu, 21 May 2026 05:36:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa937e69sm2356434f8f.32.2026.05.21.05.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:36:13 -0700 (PDT)
Message-ID: <bd9c0751-55ea-459e-8b22-8bd24abf235c@6wind.com>
Date: Thu, 21 May 2026 14:36:12 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2 2/4] net: netlink: don't set nsid on local
 notifications
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Kees Cook <kees@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, Jiri Benc <jbenc@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
References: <20260520172317.175168-1-i.maximets@ovn.org>
 <20260520172317.175168-3-i.maximets@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260520172317.175168-3-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 20/05/2026 à 19:22, Ilya Maximets a écrit :
> In most cases, notifications on sockets with NETLINK_LISTEN_ALL_NSID
> do not contain NSID in their ancillary data in case the event is local
> to the listener.
> 
> However, when a self-referential NSID is allocated for a namespace,
> every local notification starts sending this ID to the user space.
> 
> This is problematic, because the listener cannot tell if those
> notifications are local or not anymore without making extra requests
> to figure out if the provided NSID is local or not.  The listener
> can also not figure out the local NSID beforehand as it can be
> allocated at any point in time by other processes, changing the
> structure of the future notifications for everyone.
I don't understand the use of NETLINK_LISTEN_ALL_NSID without being able to
associate an nsid with a netns.

> 
> The value is practically not useful, since it's the namespace's own
> ID that the application has to obtain from other sources in order to
> figure out if it's the same or not.  So, for the application it's
> just an extra busy work with no benefits.  Moreover, applications
> that do not know about this quirk may be mishandling notifications
> with NSID set as notifications from remote namespaces.  This is the
> case for ovs-vswitchd and the iproute2's 'ip monitor' that stops
> printing 'current' and starts printing the nsid number mid-session.
Why does ovs-vswitchd use NETLINK_LISTEN_ALL_NSID if it isn't able to do the
nsis <-> netns association? How are used nl msg with an nsid?

> 
> Lack of clear documentation for this behavior is also not helping.
> 
> A search though open-source projects doesn't reveal any projects
> that use NETNSA_NSID_NOT_ASSIGNED and rely on metadata to contain
> self-referential NSIDs (expected, since the value is not useful).
> Quite the opposite, as already mentioned, there are few applications
> that rely on NSID to not be present in local events.
> 
> Since the value is not useful and actively harmful in some cases,
> let's not report it for local events, making the notifications more
> consistent.
I still don't think that this is the right "fix". The app is broken. Even after
this patch, the bug could be easily triggered again by a third party.
There is nothing wrong with assigning a self-nsid. It would be a lot more robust
for the app to assign itself a self-nsid when it starts.

Regards,
Nicolas
