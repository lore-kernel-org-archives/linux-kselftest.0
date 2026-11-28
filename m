Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795879063;
	b=13qKkiM54lrJlGUwNIQ99RCv/3vFW4MEYbs1E5ghBlJ/mJ3Qc+7E/FD8/UNkeGK5h0/k
	 adKsQBpYU77CbYEfjQsXy9co7AzW3sRRKzY7E8odTLCUJvyJDeMGzzvCnYqoXmpOE2+2s
	 aFLKRusP/mx7+QVHWuMXqwDF0pldyvR3YOEFTnhhJSyWeD7SgiUGkx+xEQvYmtA1L76Ki
	 uT61s2MbkvnDEXRixQn9XMMj+Me5innHoSzUo+TonAApGMae0qqhEQdTt+6T2KIiOCoIo
	 YxYNcgCI3kjGPjmrQtj2FTVeB3ifP+TdH0nBlZAIb/2+E/a+y93IZdnU2lbbII/qAXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795879063;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dpNdnHURho09W7foXvp56zxFZAfh0ngbO16x1HKvH5I=;
	b=0dXt6t7RmB4U+PJOze1Hc7nuWGEhllxjdPzTdEhG0mHtxOy1t79JK2dN8aty0QofQDiM
	 oj8bksIzYLlJFgLVwlGOmwajA9mmi70seXh0FCG9jUtE9iaCFcgIFAM4xyOfJfOlY/ZnC
	 PATANgvroEWjofBAh+rwMilzQNuSGnMIFljXOdYwyqiQR4RfU9WS3dX75zvlZBTMXcvMk
	 OUx6CvAODF6fd7ZfCoMgAIS/ORmofjLb2k09yWDG7jlvGJhXaz2yQF/NY9ok6GVUkqfK2
	 BzGvMxP16YIa4ag4SDJIY9sypBr/+5HSBuI18J9rD0XqUwWhPT4ebPZWDj7LuF4in0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ML0/hr8X";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7F606A31C;
	Sat, 28 Nov 2026 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ML0/hr8X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AA31F00893;
	Sat, 28 Nov 2026 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795879062;
	bh=dpNdnHURho09W7foXvp56zxFZAfh0ngbO16x1HKvH5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ML0/hr8XNPk8TnSL6mWti5pwjViQhnEtSc2FwML8qbYRBYj8EVlpSZAv0e6aIel/0
	 mIsG+UxUSNgMWPsShlvN3+EorZQzB/E4+hPei0ciK5JVAFlV5/sYcRfsy5iqI/jDkd
	 qSlvFxBy8DLT52UdQYXHKjW0ojSRiNkWuGbHvrSnTqShm3Hu1eU0O5H+ClT6RolUzV
	 iDo1ytP61KSJWmq5g9Ij3clnnwaPSKelF9S5pYtnOHwMDmtPbgfysqEVkVLiqnEtKZ
	 MIIMPYzfQ1S/3YP2+mPF/aki2pdPSf64zmYjVAdRrfT5ZDuEnwsoeJ1NAgy6fAgskJ
	 rhCRylsJU6TTQ==
Date: Sat, 28 Nov 2026 15:17:38 +0000
From: Simon Horman <horms@kernel.org>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH net-next] selftests: net: socket: fix inverted failure
 diagnostic
Message-ID: <20261128151536.GA803099@horms.kernel.org>
References: <20261120005102.18132-1-emmaonana18@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120005102.18132-1-emmaonana18@gmail.com>

On Fri, Nov 20, 2026 at 01:51:02AM +0100, Omokefe Emmanuel Onanaroghene wrote:
> When socket() succeeds but the test case expected failure, the error
> branch prints "expected success got err" with strerror(errno), both
> backwards (reality is "expected err, got success") and stale (errno is
> meaningless after a successful call). Mirror the sibling fd<0 branch:
> name the expected errno via strerror(-s->expect).
> 
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

