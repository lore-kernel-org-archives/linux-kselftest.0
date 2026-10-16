Received: from mta1.migadu.com (out-122.mta1.migadu.com [95.215.58.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48E34750F
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118535; cv=none; b=spT7ygKw+WaSZeT68UM3o3Ae7myDrsyi2jCsetJvt6TB0QhOKX8LDkXUdMw1ZKOR+eFJJBbA2CP94HwAc0LRQAyPbeIZvKAeIMsg+C1u1D5P20Ma6QXBeGIdOkRvINbJ2gBsZN5pRbO2zLJ9+4BJXvKpCfgs4H++jk2qo5YjLvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118535; c=relaxed/simple;
	bh=JiozdCoEa+i8cnI7fmP2rtddLWizrFN6D4IuJeVEtY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVW4paowSqpJyKBo4rcFJS0NbBfFW7/66isgufa2x0JoMXcbe9LvZr7kReX5aYV2gSPncWersmXKEk8qT2ZtAEMa4aRnLe6B5RnYYjlXVftu043kRU4na6Qzg0jt2DxJGVM2YPbSdB7MNsCghdzL8ndaQNvStc3W/kKqg3VoX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aACR5q0P; arc=none smtp.client-ip=95.215.58.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aACR5q0P"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JiozdCoEa+i8cnI7fmP2rtddLWizrFN6D4IuJeVEtY0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792118531; v=1; x=1792723331;
 b=aACR5q0P6b7Nprm8T89n+YFuPkOPeMamjr53GO0MjKX3czR+OUsjIpB+amduBTOPgsgvnYET
 M96Eku+n6ZfMQHLfvhUq+fRyKjsyl4pJVxawCOA+uRCz43jQ3vSm85uXgwQJ43EbO7Jia2ClbXd
 uLMvWWXfIo40+ypOHvtmW068=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id aaefb83f638cd73e;
	Fri, 16 Oct 2026 02:42:11 +0000
X-Mizu-Trace-ID: aaefb83f638cd73e
X-Migadu-Flow: FLOW_OUT
Date: Fri, 16 Oct 2026 10:42:01 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>, Shuah Khan <shuah@kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] selftests: tc-testing: preload all qdisc
 modules enabled in config
Message-ID: <atGO-QnYwzjcyBr0@fedora>
References: <20261014122045.2375722-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014122045.2375722-1-ivecera@redhat.com>

Hi Ivan,
On Wed, Oct 14, 2026 at 02:20:45PM +0200, Ivan Vecera wrote:
> tdc.sh preloads only some of the qdisc modules that the tc-testing
> config enables. Add the missing ones: ingress, mqprio, multiq, netem,
> pie, plug, prio, qfq, red, sfb, sfq, skbprio, taprio and tbf.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>  tools/testing/selftests/tc-testing/tdc.sh | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tools/testing/selftests/tc-testing/tdc.sh b/tools/testing/selftests/tc-testing/tdc.sh
> index dae19687912d..25cdc256287d 100755
> --- a/tools/testing/selftests/tc-testing/tdc.sh
> +++ b/tools/testing/selftests/tc-testing/tdc.sh
> @@ -65,6 +65,20 @@ try_modprobe sch_gred
>  try_modprobe sch_hfsc
>  try_modprobe sch_hhf
>  try_modprobe sch_htb
> +try_modprobe sch_ingress
> +try_modprobe sch_mqprio
> +try_modprobe sch_multiq
> +try_modprobe sch_netem
> +try_modprobe sch_pie
> +try_modprobe sch_plug
> +try_modprobe sch_prio
> +try_modprobe sch_qfq
> +try_modprobe sch_red
> +try_modprobe sch_sfb
> +try_modprobe sch_sfq
> +try_modprobe sch_skbprio
> +try_modprobe sch_taprio
> +try_modprobe sch_tbf
>  try_modprobe sch_teql
>  try_modprobe sch_dualpi2
>  ./tdc.py -J"$(nproc)"
> -- 
> 2.56.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
