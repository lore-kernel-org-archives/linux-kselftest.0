Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A55D367B7E;
	Wed, 12 Aug 2026 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786497885; cv=none; b=NCLMMgOkhpKIFvXPnZHGpxD7YQnHn1aukixWpDheVA61m6vpJPu/XBRuKtmgfScNtj/llTYK5AXkmPrayEAiNfhQjErWBwrifw7JfEIsz1biYlK18esaD32ZJ8HLNfpUnHWAu0rQSLcrkYKQYBkPCJfR0qE/RvOQGB+ENvy2VLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786497885; c=relaxed/simple;
	bh=SveaN1HI0Z840913k3VTUqX02Kyq/a4E5RTwYMevyZw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eggYkPQ4H6yMmrbWFxKQy99/12DGiX3SMaNBUJj6hy2CT0QZtkguWQwRGqTJI17l++DVqDBhJ2gKJ0Aq909Qr998bimz0Tf2g15yvhc5Nleu0/X+20ZmM8E2c5WoMGe7ZTzm+iTxQpWyR68Jm2ASi+Bd1Fr/5+hTIMStyERiwNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjtTe6m9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjtTe6m9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB76F1F000E9;
	Wed, 12 Aug 2026 01:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786497884;
	bh=voFvltF8jBsPIVxNqb5s4DIV0IhP46ekD3snoqZ0KGw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SjtTe6m9koJJuC/Y6Ej9qfVpczBMDSP666CMSXlduSV3t9PAX9sw5ggNjgKlr9ALY
	 GnEcx5IjYC7mdLTrI9gbfTdRNbqZZYWJR1aonaFZ1WRYlC0dmihU+oQtflz3JFEaBy
	 63H18qqoF7NLflPA3pMYKGXAUukpTGL5PmR4jd0wCqPtJPbgwQHU+jXoKkdXZmyzk6
	 ETfPMnovO6Ik72M6CoiYnu6PrBddKxK1ni91S3nKGFCh8thbWWbab2etn/GxHxCJBH
	 lSoWtEb6QrZo3RWzRT3E0RArQC5qtya5MSqwBqB0x/7X24PYRe7xZp2b35Zu2942uI
	 aktvTgnZCkr8A==
Date: Tue, 11 Aug 2026 18:24:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/5] selftests: net: create own netns in
 ipv6_flowlabel_mgr
Message-ID: <20260811182443.3961ab0f@kernel.org>
In-Reply-To: <20260807220942.421382-4-marcelomspessoto@gmail.com>
References: <20260807220942.421382-1-marcelomspessoto@gmail.com>
	<20260807220942.421382-4-marcelomspessoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Aug 2026 19:09:40 -0300 Marcelo Mendes Spessoto Junior wrote:
> diff --git a/tools/testing/selftests/net/ipv6_flowlabel.sh b/tools/testing/selftests/net/ipv6_flowlabel.sh
> index cee95e252bee..2eeda39bf64c 100755
> --- a/tools/testing/selftests/net/ipv6_flowlabel.sh
> +++ b/tools/testing/selftests/net/ipv6_flowlabel.sh
> @@ -8,7 +8,7 @@
>  set -e
>  
>  echo "TEST management"
> -./in_netns.sh ./ipv6_flowlabel_mgr
> +./ipv6_flowlabel_mgr

Please send a follow up - remove this from ipv6_flowlabel.sh now and
move it from TEST_GEN_FILES to TEST_GEN_PROGS in the makefile 
