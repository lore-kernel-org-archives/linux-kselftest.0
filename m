Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B12314B9D;
	Wed, 15 Apr 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776248777; cv=none; b=u6jkHrnyS513l274F9wJLNL5cdLQ9a/d7/vM6bgZ0081K81ujqFU6aVA465mY/byqNWRccZ+SpUSsSj22eVUhDiP0sd8J+sVZHmqnXud4Gij1mWMpA2nK4iXukOVtwwx4355Mgz/o9XhQgUmNsO0R07Kj0O+BhIyxqwJoLcdrmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776248777; c=relaxed/simple;
	bh=WUnFtqMqBwiQmUTfjICkfjVtSGlHuFpTjc9sHdxlaxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpGDAS/i1z+tp6g5eil1jR0NGU8WtKI35t18KnRlUc7iVviKnw+Z24Vy6Q38OCPJNl2148TO/C1j/+yXcqGeRPlr88nFUaJYsDp++fzbvRsZO11yRFIWYpOuGPdIEAfbRmbLyI5xfKyoaLSHcs1YxL85HKkvFU94f6VOoImiOYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=OU3amlUQ; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="OU3amlUQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mrD7p6MJhVAVx6u8xXz0QG9VMVnUTAIfPFAq0M1Vv6Q=; b=OU3amlUQTKjS37WD9mYssvvkZZ
	0+9Cv+jy23UrYrkx53/mISbJpY1iSgsdXrU/d+uXN5Bs00FM8Wp4pcvSiIXPMqKCCJXJOZyFU7rFD
	3ZUWmXD3pbIK74+VfbdF4dZmXXpfpqPyeGPAG2AMBSk98MKQk/RvQEU5w/laMhI/JwtU56PojDrXF
	NVGiUR/KBSZHYzhlczDkA0zE3NdWbANIYQ99GVohe7hTuOIDH3PbUiXur1cr2B0MuAZ6dvSMQccpM
	t+ofSABY8r/rU+u6vP09RTYh9sT9e50PuAxQZdpbWE/98aVZV0RvgaiXyLN5B7DGxscjEm2UG8k7i
	Xi9yrgoQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCxRd-00DlvM-0M;
	Wed, 15 Apr 2026 10:26:05 +0000
Date: Wed, 15 Apr 2026 03:25:59 -0700
From: Breno Leitao <leitao@debian.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com, 
	davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH net-next 2/2] selftests: net: add FOU multicast
 encapsulation resubmit test
Message-ID: <ad9hkJXAnlv2ZUm6@gmail.com>
References: <ad7MsSJOuUU6EGwS@dau-home-pc>
 <ad7NhoxmrFJAsXe7@dau-home-pc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad7NhoxmrFJAsXe7@dau-home-pc>
X-Debian-User: leitao

On Wed, Apr 15, 2026 at 02:28:06AM +0300, Anton Danilov wrote:
> +send_fou_gre_packets() {
> +	local count=$1
> +
> +	ip netns exec "$NSENDER" python3 -c "

Having Python code embedded directly in the shell function makes this
difficult to review and maintain. Could you extract the Python script to
a separate file? This would simplify the code to just:

	ip netns exec "$NSENDER" python3 my_python_script.py
