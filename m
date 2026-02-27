Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5996258CE7;
	Fri, 27 Feb 2026 02:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772158944; cv=none; b=snePY2PC012+osbhI6hbCRuvGDqXAvFX2oniK6LcaUIB1fbXc6BdhWztK/NV1VAWRWUjxzowFJUC2m2/37w+qEhcoI7+IWBuiW7ZH/0UTGmOucyakmtDOkSbXrP3C846nUQnu2T9Fh1K7v3RqJvFxePLlejAZq7j4FvfzkndRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772158944; c=relaxed/simple;
	bh=5UQFsNO34/AGM86l8mh3znyfdIraIWAEFeFdo0pmBCw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ofKXJ9lMqxRGwbwz4x8OZtVVe3eAfGmiADnQd0nxRK6Qct4CXsfdOLnlvDj0vAXz1KC7HzfuHJxTZVCC0XC8X5Euc8O9iv2wbzxtay5jonecCNso7cCViR5IF24oHrIBM//X8gJzRDHjmUYcGOALrblA1Ymu9ZGPEg4eBIQ56Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LD48p7Kd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LD48p7Kd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F180EC116C6;
	Fri, 27 Feb 2026 02:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772158944;
	bh=5UQFsNO34/AGM86l8mh3znyfdIraIWAEFeFdo0pmBCw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LD48p7KdbEq6zGngRv3rp1U1xXh3ugnoaMEC7CuR2jvaBkNAfxDgWoObWsFgRcbtq
	 irpPFF9JBdteEBywaQsnyaSA1Tzfc1+Z4QCD/wGrS4iCqfi9X7br434pQWeLjITETj
	 1VpbPREa5uYRYSR8u0aJ+e2JAvrvs7X+rzmgCD929TyKgldxtCzUY9Nl9u9m8VdYcG
	 Vg0rAyJV+6zNLXqo948xRrt+zdJPsj5xIECO0DSdT4OF1fUT67sa0StWyICfSJG4fx
	 tOx3hW2bL/V2J8MAIbZdViOzEgpgJleHQlnroT6TzM8FG5Z5XcPoiEb7kQrZAJMg3O
	 7NSctKEyTsh1w==
Date: Thu, 26 Feb 2026 18:22:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman
 <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Petr Machata <petrm@nvidia.com>
Subject: Re: [PATCH net-next 5/5] selftests: drivers: hw: add tests for the
 ethtool standard counters
Message-ID: <20260226182223.5eb1b10f@kernel.org>
In-Reply-To: <20260225150648.1542206-6-ioana.ciornei@nxp.com>
References: <20260225150648.1542206-1-ioana.ciornei@nxp.com>
	<20260225150648.1542206-6-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Feb 2026 17:06:48 +0200 Ioana Ciornei wrote:
> +ALL_TESTS="
> +	test_eth_ctrl_stats
> +	test_eth_mac_stats
> +	test_pause_stats
> +"
> +STABLE_MAC_ADDRS=yes
> +NUM_NETIFS=2
> +lib_dir=$(dirname "$0")
> +# shellcheck source=./../../../net/forwarding/lib.sh
> +source "$lib_dir"/../../../net/forwarding/lib.sh

Argh, at some point we should probably decide whether we have 
a preference on which "library" / set of env vars we use under 
drivers/net/hw. Adding Petr to CC.

The existing tests under drivers/net/hw which source forwarding/lib.sh
pre-date the "NIC setup" described in 
tools/testing/selftests/drivers/net/README.rst

Should we ask "NIC setup" to be used for all tests which only need
NUM_NETIFS=2 ? These are basically simple tests where one netif is 
a traffic generator and the other is the DUT. And IIUC the "forwarding
setup" can't be used when the traffic generator is controlled over SSH?
