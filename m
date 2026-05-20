Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1BC3A4F35
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264535; cv=none; b=f63u4jciWvF5w8/cW8nQYyVCiz2ueSz4jngWtBjfjdWxkGkIENoPXFAa8PB+zVP6x8riZNf1Tr+TCIKYexIN+NAEKPG8vioWJJ4JxnLJLKBRUJOIlD0MjaZLq5g609UNkZw1aAT+SOrjKGHA9480z3Uz+E03WTxQX8MGwrWh55Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264535; c=relaxed/simple;
	bh=BRXJwfMfnV1zMnJtM7GywPXGIHyYEcE6F4GmrqYaR2Y=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=IpsnWMrT27oLbyC55tdAgNJDetHMaofzYxDRZ2jzGoldfXrzKmyq0Jq/DOT7BkIOww9M1DR5M5Ih6R39DymZNen67BgWN2NqnoxUM9wakp5OEPXlas4Wd2Xj28N0zpFPQL8PI9wEA1JklRM735yjar2V8ZSqWJXxPbvFMSAosow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SU3r7/Pp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F7Ms0UGX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SU3r7/Pp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F7Ms0UGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779264533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cPESQ7LAH4zMILZd/axqS8ovydxXDBYxaaBJksIM40=;
	b=SU3r7/Pp4Kq14u/s1dyPEeB/3IfbcT5GBQRgELTw3RfDhmOHKamgcftwOc4dZ8dnYzDNyq
	hyBDIHcVLkpE2qEBVtP9K4UplYfiH3CtmxWDsC3NwwVcvtrdRPDm7OTqGmNSLqgJaTmfcq
	DXWeoDEpnkxwxfKXC7inIQ9+yYvJmnQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-cuomzbFUMjioA0Ji7BDU6w-1; Wed, 20 May 2026 04:08:52 -0400
X-MC-Unique: cuomzbFUMjioA0Ji7BDU6w-1
X-Mimecast-MFC-AGG-ID: cuomzbFUMjioA0Ji7BDU6w_1779264531
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48fd396daedso28487375e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779264531; x=1779869331; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cPESQ7LAH4zMILZd/axqS8ovydxXDBYxaaBJksIM40=;
        b=F7Ms0UGXd1NRVAXhXsX1Ppoky26tWJIavAUFUYwddybbXZBqgjmukKPyl2Mesj2aAl
         W269pjTRypFQo59Nf1peEKueGjnj0jTyiDFyGqu6+LwX17ubG9GNAfoV6eXhTOH1N2N3
         O1Ar5u2MABDeNzU4N05mr965UlzffYXt2lJnq7Ll0FBkQ1HeiozV4JWajkJBAJjKR2CT
         3FyUZIjOn3YJwjQJmKWZQPt63s2LxxpJpRpMLlfemsIxMNJZJcWfeX1Sake2lZqp4wAf
         rPR3C61mK8IIxXNu2og/AYLaRj/8/gQtaB3MydqbqHn2wmZCIdqh4eBlB593XCmLEMr+
         3glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264531; x=1779869331;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cPESQ7LAH4zMILZd/axqS8ovydxXDBYxaaBJksIM40=;
        b=UtVxooilyJ0L8opa08u5GBKjjf2C6WPQ0tlginbNpVDjXQkS9K+2RfMistluoJYKb3
         q4bgEdiwCNB0+CP4j6RtZSooHkNyLvyEv3as9PDC5jWGg9sDyJOtRcyf1jmulukzbwyw
         e3HrVYvEtXir4/tPaJzdHttvdn5pHr+uD6MC5k8uQqkFfYYtI6+aWXPwOoFhZzHAsa99
         zceCaIEb0CTwlI2BRrnG0PtPLKhq5sa57Ykq6tz4ItngSHoRig3MKNvfN3vdfUQ///b+
         +VLTtG5LKPwqKdHWhCM/xlLAsLKWfL3i3oe48Am817Iz7SH32vSMKdLkG7VuKfwmphPI
         AokQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MYTKu69WL+4PqT7eHaUve86TFnVl0ruLC/N38zqAK4K4MuO5LGygdQNQxOxalWOAJKuYUdYLXpltUsvqHZi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2SM8rBbqpa/WBBQ6DcWVlt9ixPxIm0H5NfGo7UAacsxbu9dJQ
	2a/DOacuiL0LTtG/WbhA/U5RqEMxaPRct+P1l32UiEYgE6k0FPB74MywN/GTXD3SdDSwbqjInPG
	VMLAccymLrN6j+foBgkuE3g0ZlEk3uDn3dV6I4IQlLbMewPmHG5YBPsOED/NWkpqadzAcDQ==
X-Gm-Gg: Acq92OHWPGjeuAWoCfa0x5p9fc4XNqGG1FTHD5zJJD2avKSwmt6o+4viiHTV/A1UAbC
	A34N+4Iqe0ORHyD7xBXniJ5rjmB+Szg5RMnnomTdHZ4jqhqCpX7jk/MhRDnAiL1cMp5Ba2lpFup
	0sUjKo4zp7rkQdAQx+yNFoYXDRaJ8wzSagOPCold9BZAYY6FmdFkF/udMLVPbSu8eJ3bdMNiqrG
	QgVeXHkT+PO33HPPmZA3gJaD/AFJ7B+z5Nv+AACAsmPjgbOue4aczG4ea33aFm+5FEtkU8l/0aR
	C3QY2Ey1xmUOhlwoT28uoRVgdo5/tCKdAVhwF3MIeo0VqLknRklp9fSBGF1E710GhE8lDSiHGZF
	yZNv7uGzK45ubduddND5aa4qokbnFUwNV
X-Received: by 2002:a05:600c:1389:b0:48f:fe2a:107c with SMTP id 5b1f17b1804b1-49001285b87mr227310215e9.6.1779264530719;
        Wed, 20 May 2026 01:08:50 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:48f:fe2a:107c with SMTP id 5b1f17b1804b1-49001285b87mr227309635e9.6.1779264530196;
        Wed, 20 May 2026 01:08:50 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c833fcsm379368225e9.2.2026.05.20.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:08:49 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Pavel Emelyanov
 <xemul@scylladb.com>, Laurent Vivier <lvivier@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Jon Maloy <jmaloy@redhat.com>, Dmitry
 Safonov <dima@arista.com>, Andrei Vagin <avagin@google.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH net v2 0/2] Fix race condition between TCP_REPAIR dump
 and data receive
Message-ID: <20260520100843.3646f1f6@elisabeth>
In-Reply-To: <20260519190352.45c8478e@kernel.org>
References: <20260518183424.3144867-1-sbrivio@redhat.com>
	<20260519190352.45c8478e@kernel.org>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Wed, 20 May 2026 10:08:48 +0200 (CEST)

On Tue, 19 May 2026 19:03:52 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 18 May 2026 20:34:22 +0200 Stefano Brivio wrote:
> > Stefano Brivio (2):
> >   tcp: Don't accept data when socket is in repair mode  
> 
> Not sure Eric is on board with this patch in the first place.
> Sound like it's not the intended use case for REPAIR so IMO
> it's up to TCP maintainers whether we want to support this.
> And it's definitely not a Fix.

Jakub, thanks for looking into this.

As I was pointing out on the v1 thread, I think it's a race
condition regardless of the usage, because after you switch a socket to
repair mode you can do separate operations on the socket and the
outcome will be inconsistent between them. It depends on external
conditions and looks quite fragile.

For example, you could dump a given length of the receive queue, just
to read it a moment later, but now the length is wrong.

Note that now, on the v1 thread, also Andrei, one of the authors of
TCP_REPAIR and the matching feature in CRIU, agreed that my "fix" makes
things safer:

  https://lore.kernel.org/all/CAEWA0a4d-PpWpVexYGP5SLRuzj8hs1W1_Ww6qA4BBrkzSs4umQ@mail.gmail.com/

But I won't certainly insist on handling it as a fix and I'm now taking
care of the new feedback coming from Eric of course.

> >   selftests: Add data path tests for TCP_REPAIR mode  
> 
> Please don't add a new target, fold it under net.
> Targets are a PITA to deal with in kselftests.

Sorry, I had no idea, I'll change that.

-- 
Stefano

