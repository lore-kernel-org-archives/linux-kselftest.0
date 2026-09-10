Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA5154DAD4;
	Thu, 10 Sep 2026 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061537; cv=none; b=mOu1+fmzesWoQ/Km9fXwQSXlR0JP2OkHbn1cZG9P77GgfEDyhHK0PFXTW1Y12Y/CU+4D91kdMu+oU4xHoPYv+Qf/eNoW+rf0aYVnQEAVig8P8zx0ANUuQR6vcuS3grvvY2XDDhLggSi/ft6GWh+O1WqCN5Td3cAn7k5bCH89qcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061537; c=relaxed/simple;
	bh=TeajW6YX4XURvUaQlRT3L5m1kJ/z0TYHnhJ5OPKjazg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=jNPpUJ4Pz59rsVPfq28FHihYxq9RiQmhFKR4zChNdkXj7+Y9luyC+m64cotXxw3d6Xy0N5HH3pJuvJ2oTIrI5xWPJ0rtcnnW6japMGDqDxrzjohbe89ELFdCapo6w/EN0mJ36+dScO6U1kFqDrTLdOKFPtH0HXi1bsHIxcSsTMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=sD2r2hh+; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="sD2r2hh+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E1AEA9069;
	Thu, 10 Sep 2026 19:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789061524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qLUs5arjPZd0srTEGrwX3HJtjGsgylppXy60tcVHXJw=;
	b=sD2r2hh+em/cQgTw1qumTyjWRGbvJGFgqykBDy+PrEVZYyKn0hgI0l7aBqx8iZLwWWc7iS
	KQQjvwo5Zdt5J9SIMt15flvK4CLy77D8VplBPAsRsQxT9imOrUlOP/nylPKxtMTyXgU/I0
	pJGxoIeW4D/2uN6D34suOX3sgPT4M7/7wh8AF1mdsAXtVZdxKCiR2pPNjE00xfzyqlXuSO
	RQD3UNs9HgwAo4yQ/Q8oxzFiqi+bE18HR+060c1mc+lDo864cJrSQiOe14NlObiTi6o1rL
	m0Ydao5hc24skDbuOL/4usOyl3jshw2b3w6UYTZGdYdMy5n19tvVXJ3XFkNiZQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 19:32:02 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Bobby Eshleman <bobbyeshleman@gmail.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, matttbe@kernel.org, Stanislav Fomichev
 <sdf@fomichev.me>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RESEND net-next] tools: ynl: Fix out-of-tree build for
 ynltool
In-Reply-To: <20260910165451.1027541-1-maxime.chevallier@bootlin.com>
References: <20260910165451.1027541-1-maxime.chevallier@bootlin.com>
Message-ID: <c44d371714839566a02cd9c944c7e177@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime

On 10.9.2026 18:54, Maxime Chevallier (Netdev Foundation) wrote:
> After the blamed commit, running a out-of-tree build for ynltool fails 
> :
> 
>   # make -C tools/net/ynl/ynltool O=/tmp/o1
>   make: Entering directory 'tools/net/ynl/ynltool'
>   make: *** No rule to make target '/tmp/o1/json_writer.o', needed by 
> '/tmp/o1/ynltool'.  Stop.
> 
> ynltool's Makefile correctly accounts for $(OUTPUT) to get the list of
> object files to generate :
> 
> OBJS := $(patsubst %.c,$(OUTPUT)%.o,$(SRCS))
> 
> but it never actually set $(OUTPUT) before the blamed commit, meaning
> that out-of-tree buils of ynltool were always actually in-tree.
> 
> Now, the O= parameter is correctly accounted for, and the %o: %c rule 
> fails.
> 
> Let's update the %o: %c rule to also use $(OUTPUT).
> 
> Reported-by: Bobby Eshleman <bobbyeshleman@gmail.com>
> Closes: 
> https://lore.kernel.org/all/aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com/
> Fixes: 917f713b4ec4 ("tools: ynl: Allow cross-compiling ynl and 
> associated tools")
> Signed-off-by: Maxime Chevallier (Netdev Foundation) 
> <maxime.chevallier@bootlin.com>
> ---
> Re-sending, the previous submission didn't reach netdev@ :/
> Fixes a bug in net-next, so targetting net-next.
> 
>  tools/net/ynl/ynltool/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/net/ynl/ynltool/Makefile 
> b/tools/net/ynl/ynltool/Makefile
> index b8c67cdb4fdf..1053e7606c86 100644
> --- a/tools/net/ynl/ynltool/Makefile
> +++ b/tools/net/ynl/ynltool/Makefile
> @@ -31,7 +31,7 @@ $(YNLTOOL): ../libynl.a $(OBJS)
>  	$(Q)echo -e "\tLINK $@"
>  	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm
> 
> -%.o: %.c ../libynl.a
> +$(OUTPUT)%.o: %.c ../libynl.a

There is a second issue if I'm not mistaken:

   out=$(mktemp -d)
   make -C tools/net/ynl/ynltool O="$out"
   touch tools/net/ynl/ynltool/main.h
   make -C tools/net/ynl/ynltool O="$out"

-> make: Nothing to be done for 'all'.

Add $(OUTPUT) to the wildcard include

   include $(wildcard $(OUTPUT)*.d)

and it works.

>  	$(Q)echo -e "\tCC $@"
>  	$(Q)$(COMPILE.c) -MMD -c -o $@ $<

Thanks,
Nicolai
