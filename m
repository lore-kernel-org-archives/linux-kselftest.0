Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276E2110
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 00:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771805253; cv=none; b=M0E8jbl3/s7H2vFXUAnZwX/frlGcwoREm6FbFHfhYu65FnKLdkaVb+sgKViwCWEXiCQ5/IDp9ZkwxjqeqUPzSmUhaB/8HWhzTDH9vY59u+JdCTKsIRHTFb5PkOMFEHgenbfc8eT2HX9OZNaMhosBlYGqi6xIjudleWpG1hxJAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771805253; c=relaxed/simple;
	bh=XL3GK1srBYNctAMCr4LIXYb0AmtCQmrv6sjvkBGn/ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRAz2pEv6k3GSYsaJWu26Ep8zft8sfLvCbmjup3eF/SG7faMmNGwNPaJ6hAYb3ymLgyaoh3iXBYFZBsI6R1wcg6PE96FaTbNkbdgo/nxNO5lgoXyW/4EqtTCjyTI4GpPvbbpsg0j8bQ3kJs9CdFsjTVvdzCWue/S2+pK15yf2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6+/6xFa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6+/6xFa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso31974675e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 16:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771805251; x=1772410051; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOqNCHYi5/n2sZSN3I12xrG8kdOz0JTtrUngqbnvPM4=;
        b=I6+/6xFabuflN1j6IDRGaaAVtNwTj4IWYSrFztIldfykNe7DpIrLOeAVVsws+Pmx1X
         u6Wnw2MNoDH5HH9gK3vXJaDkva5sJVirUn5ZpiGm9E9hrE1imDiDudpv8BkKU2hqVjgc
         iTNysnOheIjIRlJHFkywNC+0PH9RRVL2JV9qTXf9QzG1BAcNIQ6r9Kp1947b0Emh46Cu
         WRcvIUJQKC61ZRxAZR44E9V5Cbg4XBYHfU/Uudkwb7tGPWmqV/EiCZtnpMNSk8DVyJek
         pVKZGzFFqFlUeuhOjyDXec7SAzIlI04xxI8h3G5AX97QS5NjcnAyxbdnjc2vuYq+yxX0
         8b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771805251; x=1772410051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOqNCHYi5/n2sZSN3I12xrG8kdOz0JTtrUngqbnvPM4=;
        b=YpuARCmsRG0EpmaOvg20tTlKOrJirfk1+rgWyOEwZDDk+6mtNGsIRa9f0VIG/hoZ5O
         WbumT38taROxwpadnrlu/qyyVJis5+qFaR6/P2hqxqZV+A0RytOxSXzEvKoOW4cI59DO
         m/bjKca8eGu2Qp9P3Syq2pI3PJjaztKNn9/Tm5tbfR4y/cVi1TieWfFYhM7e8BelxcP7
         UzmK5O5oL/E/2KvxfwbO8smrl1Ou/o7nfZ2gUQleOAUcOPvCVhNeJKAhNmAvaM8NCDkO
         nkxe732iiA9ArAhbzQO/YdULpDDaz/mSHfc6Qv7PZDUoOYV3PPsxgFJHb0zp7Hl9mJl7
         DSSg==
X-Forwarded-Encrypted: i=1; AJvYcCUcRCEjWqiE1CWzQU1lysWHnYaziVJ05DLvwaJ+wEIMjG/nQVn4fsTgLtCxoiVh3HW1HF6mWAMSWEpZo2Uz9mA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwvOwfoszgkUoWVYwOB9V1KuEf3lP/7Tn8J/sQo9VUHN/1xOy8
	dSLWwSsM4yNq/Mmdz4IyQp084DJAERhuL3aMn0wq4XJ3PsDnqfMc61KK
X-Gm-Gg: AZuq6aL3TGwtyrWCOHa+6JcYwAIY1ZrKPfM40/RmDIEjcFVQCf1TtMjE8cIIfeZMDQZ
	gq0+ZXh5n3i1xch328/PXIeWOX4JhoIIVsbqALEFGuhliub3lglgQrpOCJmzxzuEhpLQDRF3ifQ
	hpDHfSmzgQ+u0oobzWx62tppMFRDM9uPd3J+aEGnactC3lrnrGFmxZrqfBJWHjaBIsM+4dhNwdM
	4dlKEB8yUQiQtJb+cqGnZlt5BemHSpFjQOSdr7gFv2msFvZBtqNCof/Su0vlqHI2CbRpwHSCtwP
	6ZJHDuE7AR3D/XMLzd5Dzdz6cMoOo6oO1/QnfYUQnrPZcdzMpm9TJNnwO6dS9PmJMwY0em7A5K1
	7RtY2oFeUcQLrFag6J0AGYMxLG68Uba7sNHXTxUxU6BrMUOA89nPc1T7avvc+QxJQZMTraKRgOl
	sqxWFAGO0HFSTMQCNFgzyk6HR1ju4KU/ZYiLER1W3pLjEuTg5RH9aIxD/sOZFHuw==
X-Received: by 2002:a05:600c:450c:b0:480:4be7:4f53 with SMTP id 5b1f17b1804b1-483a963d656mr119551865e9.31.1771805250470;
        Sun, 22 Feb 2026 16:07:30 -0800 (PST)
Received: from gandalf.schnuecks.de (p5b2e2ef5.dip0.t-ipconnect.de. [91.46.46.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3deb73bsm71630745e9.3.2026.02.22.16.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 16:07:29 -0800 (PST)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 451FC2FD757A; Mon, 23 Feb 2026 01:07:29 +0100 (CET)
Date: Mon, 23 Feb 2026 01:07:29 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>,
	Stefano Brivio <sbrivio@redhat.com>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>,
	Christian Ebner <c.ebner@proxmox.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/4] tcp: RFC 7323-compliant window
 retraction handling
Message-ID: <aZuaQSdsuWaAZza8@gandalf.schnuecks.de>
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
 <CANn89iLd=P2nftdMReVkc+d-8+0PGi1ACxhrhnVCxFVxNOhvJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iLd=P2nftdMReVkc+d-8+0PGi1ACxhrhnVCxFVxNOhvJg@mail.gmail.com>

Hi Eric,

On Fri, Feb 20, 2026 at 09:58:00AM +0100, Eric Dumazet wrote:
> Hi Simon, thanks for the clean series.
> 
> I would guess you use some AI ? This is fine, just curious.

Thank you!  Yes, I’ve found AI helpful for getting familiar with a
new code base.  I also use it to refine or clean up the wording of
bigger commit messages.  Code generation works quite well for quick,
throw‑away code (like reproducers).
 
> Can you add more tests, in memory stress situations ?
> 
> Like :
> 
> A receiver grew the RWIN over time up to 8 MB.
> 
> Then the application (or the kernel under stress) used SO_RCVBUF to 16K.
> 
> I want to make sure the socket wont accept packets to fill the prior
> window and consume 8MB

I suspect generating 8 MB worth of RX data in packetdrill won't be
fun (unless there’s a trick I’m missing).  And using regular TCP
sockets on both ends would probably be rather uninteresting (no
packets sent once RWIN = 0)

It might be more practical to extend one of the tests to create two
situations in packetdrill:

1. Zero window:  0 == RWIN < 2 * squeezed SO_RCVBUF < tracked max. RWIN < 2 * original SO_RCVBUF
2. Small window: 0  < RWIN < 2 * squeezed SO_RCVBUF < tracked max. RWIN < 2 * original SO_RCVBUF

If these limits are sufficiently distinct, we could probe tcp_sequence() and
tcp_data_queue() paths in detail using:
  
* pure ACK or data packet
* in-order or out-of order
* within, partially within, or beyond (max) window

If we can show that we can't use more memory than expected for the
squeezed buffer, then the original max window size shouldn’t really
matter.

wdyt?

- Simon

-- 
Simon Baatz <gmbnomis@gmail.com>
