Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869CF42E8C8;
	Thu, 10 Sep 2026 21:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074773; cv=none; b=oBQ3AlWqocrRc4ekXAtgK9Or7ZHqSf7HzJu7S8JfzPXg7x+jCgUKvGcN/qdbTit4eAcYJCoiqYlDF6j3o3WksQLZhmK6f73WDERtmGlS6NzTe5Fc4NcJVFZtEZ/labZKokmB3GQIEoRaz7mggUZNMKMVfhfAl0XQlsaQyhlQABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074773; c=relaxed/simple;
	bh=hWWejmPcK9EHtzVhHMSW24Pw9QO69mDf6F25trzVSnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntamhBy/jB6H523DG3XbCpE6gwTTMVHTe1t+XlFCdh/8+UDTL7u3wUnDg27wIcqdDChGaHKPKdU5Q2iWn0dwsVBwwJUr+AzwkHUkt1wCAKsChHQG0jBjvyV9hbqaBJkZtzthUjmPFDvJTN4Lj5TqYpk20D5ImRDcymPXYTXqgsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AEyDU9ut; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AEyDU9ut"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 72404C653ED;
	Thu, 10 Sep 2026 21:13:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C755FC38;
	Thu, 10 Sep 2026 21:12:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BEF311C78B21;
	Thu, 10 Sep 2026 23:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789074749; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7k/Q+epuiQ3Jl5DJIjynsIvxjon47tfYKTZ/kLxx7wQ=;
	b=AEyDU9ut8/75EVu9iSXRzZ0YPyxGO2CeO8gzXE8otJxlRWsiyHlK3yLcCb6UGrJEd6WMO4
	wYdrtcZVrzVTWDqAk39qL5CaKfaNi0/fbiCskfw1KhYcLikqYvlspMgLTPHnsHRePvZ7SC
	692Rdori4hxDc6wt0I3dV/MLYXGHHQVTumLQ4MrkIsfP1Mc2XN7zke+RBbxSPbsLCexkEW
	p0FpfbUASY597VJ3yZT0FPSowfxy1VoDfSlikyVk869NmHB0sLrAhmgSLChaYwPubQdDyU
	0QV5G87lXECE+6R2D4zX7RJFA4U5Ov2QsukFA2YT9SrbUA9KD197dnFWaTR+Hw==
Message-ID: <17c701f4-e0d1-406e-ab4b-7d56d3eb5a09@bootlin.com>
Date: Thu, 10 Sep 2026 23:12:24 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
References: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>
 <aqLkhcMb8uSKhQZl@devvm29614.prn0.facebook.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <aqLkhcMb8uSKhQZl@devvm29614.prn0.facebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Bobby,

On 9/10/26 19:10, Bobby Eshleman wrote:
> On Wed, Sep 09, 2026 at 09:11:54AM +0200, Maxime Chevallier (Netdev Foundation) wrote:
>> After the blamed commit, running a out-of-tree build for ynltool fails :
>>
>>   # make -C tools/net/ynl/ynltool O=/tmp/o1
>>   make: Entering directory 'tools/net/ynl/ynltool'
>>   make: *** No rule to make target '/tmp/o1/json_writer.o', needed by '/tmp/o1/ynltool'.  Stop.
>>
>> ynltool's Makefile correctly accounts for $(OUTPUT) to get the list of
>> object files to generate :
>>
>> OBJS := $(patsubst %.c,$(OUTPUT)%.o,$(SRCS))
>>
>> but it never actually set $(OUTPUT) before the blamed commit, meaning
>> that out-of-tree buils of ynltool were always actually in-tree.
>>
>> Now, the O= parameter is correctly accounted for, and the %o: %c rule fails.
>>
>> Let's update the %o: %c rule to also use $(OUTPUT).
>>
>> Reported-by: Bobby Eshleman <bobbyeshleman@gmail.com>
>> Closes: https://lore.kernel.org/all/aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com/
>> Fixes: 917f713b4ec4 ("tools: ynl: Allow cross-compiling ynl and associated tools")
>> Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>

[...]

> Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>

Thanks :)

Nicolai noted that there's another improvement to be made, as we don't
account for modifications made to .h files. The diff would be :

-include $(wildcard *.d)
+include $(wildcard $(OUTPUT)*.d)

See [1].

May I keep your review tag if I add the above diff in v2 ?

Thanks,

Maxime

[1] : https://lore.kernel.org/all/c44d371714839566a02cd9c944c7e177@tipi-net.de/
