Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1336828B;
	Fri,  6 Mar 2026 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772767053; cv=none; b=c+bkFK+bUoooH+8IB59pmoJ17SFmV2/CGTVtVTyJlJN4aMYHktnDlozGObJSzNbCi9QBNlr07jlzoBeXf8ceS4rWnfeklLLAv7mEXDTa/s8WyoAHMvPm+vw6GSz0WmQ510dKpooVNBx14t5La7mJvON+6rmrsACRgP0ju25xJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772767053; c=relaxed/simple;
	bh=t4oLNIkYz+L9+TIFHYxdrKXRLaLfM3vhCaTrNegtn+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QyPWFJVscNC+TI1AG0XU6yhLN985ajFUhPIf+ld6ZAIU472+6sIZFG4rg+KOBCEoKzTdupjVn3gc1r/eeAn0kKUxFFImfyAC1mZzRkppoc0zZI4zYI4uQ9ieGcDHmtdRMmJ0JrI9no67BFdXHf/JUtQbtepljJVDH5Cshgj5PeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDJOgiJS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDJOgiJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08F0C116C6;
	Fri,  6 Mar 2026 03:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772767053;
	bh=t4oLNIkYz+L9+TIFHYxdrKXRLaLfM3vhCaTrNegtn+U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hDJOgiJSgjm1f7pKAljce08nGYQAFFWox+knBaEC9gRmJYBxE8n2rArVNZhNn7ZMz
	 6wjqwuCRlbRA2RGzFCBoO1Kh7Zh7nAJ0ZUfZ09Kjd2KXiewd6zn0ZyxwDxoK2fjt4V
	 viV9h0QfvhJ1r7CHz7RvoU9HVUrjGufU4ORDx/h5swb5xJptWSk7ASORVqbbMRMPFv
	 /jAskr88ddT4CNKaZD9fzUm8QFCUkn08hu3dgftqLQc0V25XxihUWzVoPomhGb/ncn
	 Agy8yE+d4pbmmEV/GYdoSrN72iXRESqVCF4pXZ39TvwXy45b3ecWfFBmwuk8DIRghR
	 rqSjZZahLUtSw==
Date: Thu, 5 Mar 2026 19:17:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Quartulli <antonio@openvpn.net>
Cc: netdev@vger.kernel.org, Ralf Lici <ralf@mandelbit.com>, Sabrina Dubroca
 <sd@queasysnail.net>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, horms@kernel.org
Subject: Re: [PATCH net-next 5/9] selftests: ovpn: add notification parsing
 and matching
Message-ID: <20260305191732.2bbc386b@kernel.org>
In-Reply-To: <20260304230643.1014-6-antonio@openvpn.net>
References: <20260304230643.1014-1-antonio@openvpn.net>
	<20260304230643.1014-6-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Mar 2026 00:06:23 +0100 Antonio Quartulli wrote:
>  .../selftests/net/ovpn/check_requirements.py  | 47 +++++++++++++++++++

this file is not included in the Makefile, it should probably be under
TEST_FILES ? otherwise when tests are installed with make install this
file won't be copied

> +if has_listener_requirements; then
> +	for p in $(seq 0 ${NUM_PEERS}); do
> +		setup_listener ${p}
> +	done
> +fi

There should probably be an else branch which prints some kind of 
 echo "SKIP - requirements missing" 

Your requirements.py script prints stuff but the output needs to
contain the word SKIP
