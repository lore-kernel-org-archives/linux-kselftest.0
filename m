Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598FD3515E6;
	Fri, 24 Jul 2026 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784930839; cv=none; b=D6QOBT8383JuVNU00sb4GvFKvpEO67HmMiSA74PydfLngaA51Hrv9QLWI/insoB1rig6YVLHh5kYM8r9Gf9dum/UZzZYCHq6nQfleG8MSNVwGA6gqeJUV+DvSv86V6fP4immGkzi6LAlE3UeTuYBh0Jf0j6PGySDX//iyPgCAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784930839; c=relaxed/simple;
	bh=8NarQ1MpEe4feA0wJx3ntvokx8L9acVWACP5iC3OC0E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=prwUE+CmHDz+dmvYpDiNez1CEfbN7UcVQSjwcFLP6aEHCNfszvpb+3DWh15Js7JCTvAj6X9qCJH0w/YILzpZlePYVnIvkaIH4b/qcFkAyXR378depY33peUDrOkqruP0oNbnrHOi/sZ4nCz6DSgyF0LGNycJCTUYnryHRUvqE7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoaJDvqp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoaJDvqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A8B1F000E9;
	Fri, 24 Jul 2026 22:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784930838;
	bh=rukVo3Uuxy2j0nXqDDCCRKfJrQ9NUXslYxPOy5lqKT8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UoaJDvqpyE4e7TV8TyphVrpMyLeA1B2rGfr2vMJXNn5RvQr8plZtjmn/8Xuk7dgJx
	 td7BXxGp57IQDa2p84G276YhTChpK56kNxS4kHm4DyQFDB6YF2ksFlwpF12thjH+DC
	 f1pAt5qu2VAezYIvXIRtSdPI6e5/DCGepA7+DI8QY117dJRJkIuS0b2J8EbhTHBy32
	 R6c31OyK6lPvzqmX956FMxkq5gIvjEZWTAEZIafGlqt41Q/r4/TOtxYqrV5CsvSJ3d
	 65alkCelWPNkc9obBoclx2WKORupOLevuySIVv0mpTvVfDQIyWonKqVYQo5rRw8S40
	 FYKlYBjVAu9mg==
Date: Fri, 24 Jul 2026 15:07:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Donald Hunter
 <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Gerd
 Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Joe Damato <joe@dama.to>, Bobby Eshleman
 <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <20260724150716.07c49ad8@kernel.org>
In-Reply-To: <amPbqtxPdhs9QrVP@devvm7509.cco0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
	<20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
	<20260721110903.34840531@kernel.org>
	<amPTWGX/3LHepYR3@devvm29614.prn0.facebook.com>
	<20260724143001.5afa8631@kernel.org>
	<amPbqtxPdhs9QrVP@devvm7509.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 14:41:47 -0700 Stanislav Fomichev wrote:
> > > Talked to Stan and he mentioned the original idea was not necessarily
> > > just for link down, but any test that could be considered disruptive to
> > > other tests, with the idea to eventually introduce some scheduling
> > > (postpone disruptive until the end).  
> > 
> > Perhaps have such conversations on the list? IDK what Stan has in mind.  
> 
> I don't have much to add so I didn't post on the list. In my mind, disruptive
> started as "anything that can lead to a soft reset". But since the
> sockets tend to survive these well, I do agree that your definition
> of "link goes down" is a better fit.

My recollection was basically that the test is not safe to run over
SSH (without tmux). Hence the link down concern. If we say soft reset
that'd cover 95% of the tests so it's not very useful.

The existing doc and README already document the link down AFAICT.
