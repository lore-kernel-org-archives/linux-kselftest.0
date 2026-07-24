Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42529341ABB;
	Fri, 24 Jul 2026 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893781; cv=none; b=NJrw7RFlrNQWyHzuC/LR5lnHbYDKwbTdpPMD6tgeL1DKQ2iXvWszLcOrpFlG/Na2Iyb6buqnjBzNTpX1XAXujK9oScmcHOmlNrAeJcD1zw6XURDCnvUXnBMJ84CvZDRGllEbI4tvIrGI1moJC0LG/WUkC1NNHBvQsif8gLoAu0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893781; c=relaxed/simple;
	bh=cnAdeAJLUltCa4J1vXVc9LlRJS1wfeHcBwIzJjh4TyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CoyjvtL/jDtWZk34cLGob89afLVjaxSnRaF73cKP8O6JWUzJO9Y4iXeR0xNnzxAP737UChNR/nGi8QtrVh8ezZjrtmPk8c8vux/fhUEK1WVlibCDJH+1G4jC7scCYhCb39eR0OokRFO5gQFcsbpPRIZSgzuCzlH64fcfr9/eYa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJRnWIr5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJRnWIr5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AB01F00A3A;
	Fri, 24 Jul 2026 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784893779;
	bh=A9wffIWBNTT7G1KAuQXW99HVJUqU+Za83WdAtsgq78M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IJRnWIr5WEKY90CiAd3DnViZtJaEvzI/M100VMWBvVFjqEuiZ35Fdl7ScoNTk5zML
	 q85kt6iT/rYzqzecm8rZ+cr18IF0j4Gy7ELXztTtZW1Q2tr5QUaANnThF34T9x0fbr
	 TKiQdeJNboQNx9+cr0ulsFdipkr4mdHae7qXAp0GsrisDLZY2fuHq/QYx12VqAYVrj
	 y0mAOtQSR9cNa2YNUlRjtiuobx1BDJyze+UW8gHsFfWMfYK8gec0eyPuUhg99LpGMt
	 xue6fJfVzt0wB6iVX+btp7hqbqYhLj22NKSPDdFUdaXc1TwJamWa9ONaUyOBKpHOZ4
	 I196pqBeBXdKQ==
From: Simon Horman <horms@kernel.org>
To: xiaoliang.yang_1@nxp.com
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	shuah@kernel.org,
	vladimir.oltean@nxp.com,
	vinicius.gomes@intel.com,
	fejes@inf.elte.hu
Subject: Re: [PATCH net-next 3/6] uapi: tc_act: add tc_frer UAPI header
Date: Fri, 24 Jul 2026 12:49:07 +0100
Message-ID: <20260724114906.667323-2-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717095549.10565-4-xiaoliang.yang_1@nxp.com>
References: <20260717095549.10565-4-xiaoliang.yang_1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260717095549.10565-3-xiaoliang.yang_1@nxp.com?part=3
---
--- Patch [3]: [PATCH net-next 3/6] uapi: tc_act: add tc_frer UAPI header ---
commit 070d4b29514ff2aff8a973818dd8d51372a699d4
Author: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>

uapi: tc_act: add tc_frer UAPI header

This commit defines the netlink attribute layout and enumerations for the 
FRER tc action (IEEE 802.1CB). It introduces functional sub-commands,
recovery configurations, and read-only statistics.

> diff --git a/include/uapi/linux/tc_act/tc_frer.h b/include/uapi/linux/tc_act/tc_frer.h
> new file mode 100644
> index 0000000000000..241e90827e262
> --- /dev/null
> +++ b/include/uapi/linux/tc_act/tc_frer.h
[ ... ]
> +enum {
> +	TCA_FRER_UNSPEC,
> +	TCA_FRER_TM,                       /* struct tcf_t */
> +	TCA_FRER_PARMS,                    /* struct tc_frer */
> +	TCA_FRER_PAD,
> +	TCA_FRER_FUNC,                     /* u8: tc_frer_func */
> +	TCA_FRER_TAG_TYPE,                 /* u8: tc_frer_tag_type */
> +	TCA_FRER_RCVY_INDIVIDUAL,          /* NLA_FLAG */
> +	TCA_FRER_RCVY_ALG,                 /* u8: tc_frer_rcvy_alg */
> +	TCA_FRER_RCVY_HISTORY_LEN,         /* u8: 1-32 */

[Severity: Medium]
Are these u8 attributes necessary here, or should they be u32? The Netlink
UAPI guidelines recommend avoiding integer types smaller than 32 bits for
attributes. They save no memory due to the 4-byte attribute alignment and 
using smaller types unnecessarily restricts future extensibility.
