Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD692EDD50
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 02:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772159802; cv=none; b=fPpcQMfve7eCUZ1AOKCMQtC94l3Mn89yLit9Zj13wwQTZVSZ0WlnQ5zdVM7fsUwe6DG7Qlj48DA/NZSX2vB8cILdN0kDBRzNVnZPyGrNSPnRGjcBVV0HvoDJqizEArtEWIfteQQ/WzleUTG8VfrR86JgKtg5R9NYVE+Mm/p7hRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772159802; c=relaxed/simple;
	bh=l+nEv2Y6FEb2oVcBaKlzWxtlJ3m0mj77GVOFIJR4dlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFanl7SSBzWByToaUjdz1ZP8QhM3U2xL8bth7BDSxQ4N9RMGHS4nGr3IchlrTVo+7Pwp30TXo+PrOMr2vPEdIlgt5nEJQRetBoJ+UpuB3Ohj/1Fck7ccT4dHcXV/GAFN8PQD74VhOBsvswkyv8/nVHw1p0ILCxN5f5/fyKyh/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLOmXgkb; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLOmXgkb"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c70378ddaafso1007625a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 18:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772159799; x=1772764599; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTaHWVqVPPHKKO9lr97zROxv1lwqPfLhEfsjJzvUNbY=;
        b=VLOmXgkbVw22+QEGE+XkSX6KJWiPeDt+PEYtUsEeAaUllBPgJVp9ceuCEUCuPWn1A8
         YCpiUleE7ooUWvDU0ELG7NMAwYiJF4JCWwIs42hG8Qaxl2UCO4KY6rC4wQ0cWZ6lOMXw
         t140K5rgRwxWMW/j6tokXbzObhTzv/M872i9ujz+B8nw5fl57U+GSe7mcfciLXA6QhNt
         ylF6uBrGOuiMWmdWOyIfUgFcblpUudccoh9XMLrD9/jtnOfmN8ZN/lv68dLI2BOUc8g8
         JKD1nIaF4chwU4lTlUNo0UThzf4JVhQy8x1MgQGyQF1MqaAsndqiq3Ha9FfjZ0NUB9zI
         v36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772159799; x=1772764599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTaHWVqVPPHKKO9lr97zROxv1lwqPfLhEfsjJzvUNbY=;
        b=nyPyyCLbSpg7id4rc4R+5+G1DO4HHFnDdsn27JVEVheNZqlhwPYkxN5Sp/5KEtEWoq
         KEPePRnUqjQegQK2yxUpzwOfBZ+LgXGW63wDGzvW+nWggI4PncUAXzPCGUlKr/0PonxP
         ehHXnO4ZY87ziobm2z7WSxT45rQL393WBe2hOOWtUM23t3eg1PnObxOuvUWMtL3xbRLd
         1zvzzzo/AbU1axZGxC7l41UxFAXzF8pJsmeT2/ndnYe7k00oA9hQdyXLf18zVf92yyfH
         g+5WitmqTbwQBt9OEYDAlO5YnXhkmpOei3edDzwT7s7rWY15ycMD1UDsCKiljl6Kvb+u
         5daA==
X-Forwarded-Encrypted: i=1; AJvYcCUBhsVSyQ2ruUwT2lmDyVYm+bXAeQI0EnQJEHTu6s8z5warONx/9gYGeSS509FFCFL9yVgJ+m5ZpVcre7Eu6HQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YztLvTARi//d8P5wJA+yUVXBay1P2tTK4VXQ7k1r9nDOCPeD/HE
	j1RM25gyGaEyyq3AacELr99m5pth0Vw/u/qdQoIDhA/cyMCHGvNFHrpc
X-Gm-Gg: ATEYQzy9x+m4IskoQPZgamVuvC0R3qf+4qb3Z4lNyDvwYY9FgkU0K3LCqFbX59WewTH
	0qUZ4LEcenoTZZw8zkyJZR2md2fp/i1gmdwBNcrBOZnJTYDym/MevzDD8osPMGZimBQQ7HK4N8W
	DuUZZHJci2bn5XooIp5/GTcsgwPBMpRfZmvDz54+QlG9qTWD6g/zZOxbXFT8pqECjYjjOe8Mils
	NzdkbxrMvjmDR/YyfS4BB3F9cFbI4eO4e4654/nt80tiE7iKRL/NK/wE3IqBBc+8eGpuS99Nasp
	Sv9U9H+4SuyK5BCIb1AWtsHGa9XuPTfNxXSKWSAeysCGPhOB1e4Sy+GOKkTzPnU3hweBSgS6js6
	Ht9r6y5vt6s/O7bwJ3jomLaHzHvxeE52BaPDRgQVm2eK4PQ129zGmnONSSRidgISCsgaJsuLXsU
	2tjsQbEI5/JsHMI07XCcwEYUsTkx0=
X-Received: by 2002:a17:902:ccc7:b0:2a9:db7:446a with SMTP id d9443c01a7336-2ae2e3ce5a1mr11578285ad.9.1772159799125;
        Thu, 26 Feb 2026 18:36:39 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b257esm38646095ad.4.2026.02.26.18.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 18:36:38 -0800 (PST)
Date: Fri, 27 Feb 2026 02:36:31 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jay Vosburgh <jv@jvosburgh.net>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Mahesh Bandewar <maheshb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Liang Li <liali@redhat.com>
Subject: Re: [PATCHv3 net 2/3] bonding: restructure ad_churn_machine
Message-ID: <aaEDL09GtkQnlE8X@fedora>
References: <20260226125331.28147-1-liuhangbin@gmail.com>
 <20260226125331.28147-3-liuhangbin@gmail.com>
 <941081.1772152606@famine>
 <aaDq5vTsk8SW4bIA@fedora>
 <943602.1772156533@famine>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <943602.1772156533@famine>

On Thu, Feb 26, 2026 at 05:42:13PM -0800, Jay Vosburgh wrote:
> >I added it here to help new readers and reviewers understand the logic
> >quickly. If you think there’s no need to include it in the code, maybe
> >we can move it to the commit description?
> 
> 	Personally, I'd leave it out, and just put a reference.
> 
> 	The churn machine isn't that critical, even the standards
> committee didn't like it and removed it from the 2020 edition of
> 802.1AX.

Oh, I didn't notice this. I posted a patch[1] to net-next to export the
churn state via netlink recently. Should I revert this patch?

> 
> 	Still, whatever we provide should work in accordance with the
> 2014 standard we're nominally conforming to, so functionally the patch
> looks fine to me.

Got it, I will remove it.

[1] http://lore.kernel.org/netdev/20260224020215.6012-1-liuhangbin@gmail.com

Thanks
Hangbin
