Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3ED275AE4;
	Wed, 25 Mar 2026 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403753; cv=none; b=h3j6sXd2u4gXe2Os/UdKoO/4OaBbnuOfJjxeerL3wPEksTDiTha4r4zAEi1Xud/22Sk1+Tb3AvEX4zjZezJI+UbZ2HOR/ZwNwszKVj7kZ3z9OXP7x58MNSw/6IT7HVsqBMy5KZyfYvw9gHoopulkPgO9KGw7uBEtVHmX5/aEOMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403753; c=relaxed/simple;
	bh=AO1n2OQFfBShKGji8/+x6O7t8b8gAej/AQEfSxyBzAM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=R4DYOg77tvbkcau4eGGSeDu/TdqlnRf8kgyiMXL/SK0ewoDdknOmJxE9EhCIqMq99F9yZ3FmVVaNAo6gUNagu4HVDOoCRM2splGDFcbTGvihA9tDVTmlmEEf6JlDefePXPh6PqmY4HhbgI8hJcA2oHNVIzlJHgoRVAB3orS+rQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=jafAj/Ul; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=VjGJHZlc; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="jafAj/Ul";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="VjGJHZlc"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 62P1t9rh020523;
	Wed, 25 Mar 2026 02:55:14 +0100
Received: from lubuntu-18.04 (host-87-1-227-32.retail.telecomitalia.it [87.1.227.32])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 63E4B12063B;
	Wed, 25 Mar 2026 02:55:05 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1774403705; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F49BvdOZC0epAZt3sxFlQ714PAQI37yFuYwhKiX8ffk=;
	b=jafAj/UlNjte8tnH0nw8iad79lqe2oYDVgYE1b96ZlTYup9XFUinOWOdbqgmEHLM+W+5Dx
	STkUfXllqcw6LLAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1774403705; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F49BvdOZC0epAZt3sxFlQ714PAQI37yFuYwhKiX8ffk=;
	b=VjGJHZlcmDacXtEU2TJ6btQ4TxgesV4r50K1D0NPVOKUYzo4Eu6zLu30OVC7+DiTDKo7Fu
	Oz4pDIykKkABy5pB6P8Ti74ldvEtp8fHezXP3gZkbCw/FpgX+2sDpk0o++wIx+9FkCcSw+
	zHVYW6xdVwA6j+zYjbvJnSVNpf/GR+Max9mDIVQTXi6HR3ufdZfJ+WEoFVVOcOrAJDspix
	Cw4IgCeXUsxhxyyBdyCmsbQBeKyICG1WWPjk6DTHJhD+TNppFhFicVfDvqTzVyglxGWVz7
	ieM8MXczI/tvYgkIIAsdOZfOV7eMeUwXm5Np6cJPxw+Z1MKBg2NAfFnZG6T43Q==
Date: Wed, 25 Mar 2026 02:55:04 +0100
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Justin Iurman <justin.iurman@6wind.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        justin.iurman@gmail.com, nicolas.dichtel@6wind.com,
        stefano.salsano@uniroma2.it, Shuah Khan <shuah@kernel.org>,
        linux-kselftest@vger.kernel.org,
        Paolo Lungaroni
 <paolo.lungaroni@uniroma2.it>,
        Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next v5 2/2] selftests: add check for seg6 tunsrc
Message-Id: <20260325025504.9fafa4d3bea486595827a777@uniroma2.it>
In-Reply-To: <20260324091434.359341-3-justin.iurman@6wind.com>
References: <20260324091434.359341-1-justin.iurman@6wind.com>
	<20260324091434.359341-3-justin.iurman@6wind.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Tue, 24 Mar 2026 10:14:34 +0100
Justin Iurman <justin.iurman@6wind.com> wrote:

> Extend srv6_hencap_red_l3vpn_test.sh to include checks for the new
> "tunsrc" feature. If there is no support for tunsrc, it silently
> falls back to the encap config without tunsrc.
> 
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: linux-kselftest@vger.kernel.org
> Signed-off-by: Justin Iurman <justin.iurman@6wind.com>
> ---
>  .../net/srv6_hencap_red_l3vpn_test.sh         | 109 +++++++++++++++---
>  1 file changed, 96 insertions(+), 13 deletions(-)
> 

Thanks Justin, this looks good. Thanks for the effort and for
working through this together!

Ciao,

Reviewed-by: Andrea Mayer <andrea.mayer@uniroma2.it>
