Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2DE269D18;
	Thu, 30 Jul 2026 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377152; cv=none; b=q9xipWyKLsskb2xHB2GFj7k9U+2olNsEEFJ6PXbCKuernL+Yoj6JfMb86nH1J7ePb/A2KLgTcypWYHG2grwRk3H+AnyVFJsAcufRz6EN4n7XU+g8a1w8S4dvTak2voxlkFQM0CAKrnbtAAa4qIuVmDm77MXBfftdufmOqUB1VCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377152; c=relaxed/simple;
	bh=zCpM8nw84Td0be4gyTOO2Zen0fA+viIvdOiFxkk4Xy4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a47dJfG3+2bh8i/bpOSJgtQO2TLViNzVhppHQiXlhZ8QU+geRqVJY1bPvCuMdkL/5/clkFxnUBXSX30U7U/2G1+BTPRmNrCP5y38//xxysO/vzCpytJc/pkDabrxSYDA1Gs1avUDs0pGGuj/+VzOXS14EtJYWKnxsjKj4LJNjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fI6wqLze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fI6wqLze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6C11F000E9;
	Thu, 30 Jul 2026 02:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377150;
	bh=7x8AKkOBsrw0bA4La+UA98midhUSUxMgJkViBYIy9cE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fI6wqLzePBaYQquET0/cMEqOZvPAeABSSJzwlFj0HGdT+QcVeLdEryJGs9kekT0Fe
	 83hU0fubc2eJFo1XNhLjMhLHoFqShwPoliRkMVKbmbr0KgMW2FA4D5jwIAtMgBZqos
	 v/nqeLT1OfF5H2Hf/lswRDgl8dxviJTQVi1+aCirwv4s59/4JcXjI/hb4EPFH4alty
	 8VV+cIbhFBSNTneMDTAA/pWCnriWPfTH/kqeQMv4d29+uBZNhgEyoHp/7avfjfLDsd
	 V6NWdZEOtGXKw9WPB+Tm77Jh1wfXJ2we0qkT00NxiRZ8+bvtC13FogcGbklUTkWAl4
	 6fwom9wM7rhqg==
Date: Wed, 29 Jul 2026 19:05:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Joe Damato <joe@dama.to>, Bobby Eshleman
 <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 1/3] net: devmem: allow rx-page-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <20260729190549.4756835c@kernel.org>
In-Reply-To: <20260724-tcpdm-large-niovs-v6-1-7975f62cdfbb@meta.com>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
	<20260724-tcpdm-large-niovs-v6-1-7975f62cdfbb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 14:21:15 -0700 Bobby Eshleman wrote:
> +    value: 0  # dummy: codegen needs a number, real value is the PAGE_SIZE macro (header)

yamllint says:

  12:81     error    line too long (89 > 80 characters)  (line-length)
