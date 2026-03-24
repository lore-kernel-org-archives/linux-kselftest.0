Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E95388394;
	Tue, 24 Mar 2026 02:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321096; cv=none; b=Ndyp06Wsj0xFFwSYb8H9SjLxP2q3Hv05LL0MBAMq/FLiFv4P7Mn1Dpt1fdn4+qSPCO3N04Go8LfM8Og8W96uZp/X+QZiyC+cJRYGyIE1Hcadr6+yS7G6iXOF3QyzrXmDyoCCxm21T8rLTcaBqE/PxMKxjKhz3UTQEBiMRMBmkVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321096; c=relaxed/simple;
	bh=MuSo6Nwc8wpuYTdHUl9jVCTWnPNwm8gfgGx2pvV/oBE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOEykHYcvMahBQD3qgoKPxbDa84+WMVJsVNk7NI9Kcif5+0oQfx3AFwCzreCGewquyh55msKNu3s8Z4BebPSWyTZr9iRgh6lxlr0l7Zwaumgtz6j3gxDOep4AKOWiQlWcgIV5WZV4TFrn3dpbG2+oB06tZksDY2FKZ8nNWBx1Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZ/HZiuH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZ/HZiuH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619D5C4CEF7;
	Tue, 24 Mar 2026 02:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321096;
	bh=MuSo6Nwc8wpuYTdHUl9jVCTWnPNwm8gfgGx2pvV/oBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cZ/HZiuHF2wrJ4cm3D9neXjwaR+pWoAF849HcrGiIs8J/6qq+5HRvBflWe06nOixp
	 ZKFJ+pHi3C+QAlYYESycmgKIujcEF1MT5KfxgqdTrFV50fQtHfqKA4uakIlM0Vsilw
	 SaphnV4syt7HwkVd1kq4gHlBSh16LqGTVWtc+VG2e0p6GQt4bRgtryjOMjL17PES88
	 eDh8FpVzdRSCOSZ64ysigQaCx+9Is1SrUm3ilZIfW9mP4bQeNjOeCQ4RVCXSi+QL0h
	 /EJk5Yzl+tVtMuFImTR4n0wxpIJJ8i6KYSOpzPej7fsz3HGNkSmC1pE8DdjF8N5oJD
	 SlMrjb9MK8Elg==
Date: Mon, 23 Mar 2026 19:58:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Aaron Conole
 <aconole@redhat.com>, Ilya Maximets <imaximet@redhat.com>, Eelco Chaudron
 <echaudro@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, dev@openvswitch.org
Subject: Re: [PATCH net-next v6 0/4] selftests: net: fix false failures due
 to missing features and host interference
Message-ID: <20260323195813.7ebccd88@kernel.org>
In-Reply-To: <20260321215908.175465-1-aleksey.oladko@virtuozzo.com>
References: <20260321215908.175465-1-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Mar 2026 21:59:04 +0000 Aleksei Oladko wrote:
>  tools/testing/selftests/net/pmtu-test.sh      | 2492 +++++++++++++++++
>  tools/testing/selftests/net/pmtu.sh           | 2492 +----------------

I think I asked twice already to fix the test instead of wrapping it in
another helper.
