Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993C48094F;
	Thu,  6 Aug 2026 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044361; cv=none; b=alhwTxYKaA7w5GFp0JSBxIthpbBanyjxM9EOdSeSSr3i10htCoEsR9AREymJfys5HfE7QsZfVuy1T5F2W+TzXS4j8OXD+2RQLEytLUaUL1x+1sr+MkYTm7o5Rsev4vCOpLhc8wYBoY0wIkuZDatFHpExdsfR2Gog/ZAqA8LTenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044361; c=relaxed/simple;
	bh=l/i41j/2VO2nnEGkvLuq0WRZ6mp8jDTXu1vga28DSUE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRsuo1CfuZnSOp4Td+9n5zX6wWHrR2DD51rUTv5/VCMAf59xsJ5Cu5RyhJuQRTjn8WKGRA/bdoTGfEM1WsoL1xtOSti9drC4X8yJ3lWuMrKEbfHJHIm3QPeDdfN7OAoys9poHiJf7oauOAuLqJ4L16b5/e12QwStdFedKx3kgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZWSoCw7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZWSoCw7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101DD1F000E9;
	Thu,  6 Aug 2026 19:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786044358;
	bh=P7F/Ww0+JDR+9HwTaEj+G81ekCSaa/YuzRnXnts1XuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GZWSoCw7+xoHK5USXMtNv+MaWqT9sSNylRi+lwtSps0qHCWzGFJLTlkvG+v4KNc11
	 XHSEoP9L3jV/2iYOZVZnG3QNWd4TbPG0vW0jpuYX9l7vOactuqoul/GhXhk+CvgETl
	 T3VFsXUlkgokkmPLA0ZF/mElu/rIV1SAzZGbNy9kVbcur9rPq7awJqJfD7vCaRHUYf
	 MG90hTTMPCDEHycr77rfXoxW+G0tvm1HL/6+P5l/IsqidP4Nbeu6XcS4lX4+dq6X9x
	 MTip3c0tLjGgSlcLeOqAhOAN8uYepApy+9CnKZtJ/6eobNyHEc8ncq6W/kytxItnEK
	 tsb5jKtM7cMTQ==
Date: Thu, 6 Aug 2026 12:25:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] selftests: net: adopt harness for flow
 label mgr
Message-ID: <20260806122557.32c3e005@kernel.org>
In-Reply-To: <20260804025910.50145-5-marcelomspessoto@gmail.com>
References: <20260804025910.50145-1-marcelomspessoto@gmail.com>
	<20260804025910.50145-5-marcelomspessoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Aug 2026 23:59:10 -0300 Marcelo Mendes Spessoto Junior wrote:
> +TEST(cannot_put_non_existent_label)
> +{
> +	int fd, err;
> +
> +	fd = socket(PF_INET6, SOCK_DGRAM, 0);
> +	ASSERT_GE(fd, 0) TH_LOG("socket failed");
> +
> +	err = flowlabel_put(fd, 10);
> +	ASSERT_TRUE(err) TH_LOG("expected put of a non-existent label to fail");
> +	ASSERT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);

nit: I think you're using ASSERTS where EXPECT should be used.
My understanding is that EXPECT is better if the test can continue.

> +	ASSERT_EQ(0, close(fd));
