Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FED2EEE84
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 00:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036582; cv=pass; b=o/ulpbAxvRnnSSDFIPQ5Mzs6qNXmQHu75mIzBQECTnvxc5gNNXYXanjmu5TnhlckCMXWVfNmdYnBDXJuP+BvaGNqB2TXnZH8oaXLrX2l9sPBqRr0FVZRQdYhcimVQ9YvZMlU+qbB0A1g+vItNpt5tkO05lcQMAhL7t8Sq3eVZ4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036582; c=relaxed/simple;
	bh=BShgQSnRDZvpdNI6IHTdW+TRccJX3xOCsX6/sLv8Q2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cao5pasOqrCVfbDEfDuCaPGLypkDNoDc2bVgGTCVOyuv8uE/S+o65C0nPf4sTQjXGo4TShC2nw1VeL+8u6jwUgGoyzWMGGVm55yMXRSPa9RHH2lhlK0w0rW8XiFpF0TmR71PyXsMr91VV05Oe73iLJub4N5dtXyOOTuy02P3bx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KtNcEtqy; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KtNcEtqy"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef1d0so30414221cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 17:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790036579; cv=none;
        d=google.com; s=arc-20260327;
        b=WYa/py+pc61pZKq0QwESQpkN40HDwmlUnTuz/bUQ6Y176npVXC9Rr4syCfw459XqAv
         K96txtmy6fyaFUzIAqZ6S32j8/lyOvT/6X44wvoJkMQMfoB6yRq0om1TSqPVEOvN3/sU
         E/UjvWEgEuSzFe+6OoxgJqICFH1O5aTC4XZwXJzM/jtAYNRCE3sp4QhARGFFCKsEa1Ef
         u00X0UiseVaJd376FNjSEyaglbOI2Q7COfCp4PhN8m7PFvKiqKEu21mmskKQihT1TQA0
         Re8ElT9hR/7oXLREm2UBjTzFq43NCBV56Te1OReJncLMtet+nwNNLPX/id7xiRwsDNFs
         P7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jQN61CI3XpI1eI/D+U8aClQsfi0fYX2Xsqv28eim8Zc=;
        fh=7jqQhucSJOerdHr2U7fjMgHIcu7I09oRJPxupw9Vq2M=;
        b=gWyq02fzG40JjSgprgHzX5R76gb4N8vHD458dvn0cQiXHceQTh4FLi9+Da4DKhc22m
         9KgYDOwX7K02kNy4b2SDDk5GAspJXe7nPLuJ7ZA0ZCNBPOoNf6ra7/Wmk85o5a5xPo3X
         /v4nIsv5RPJnt/2c5NYzDBPSXZa6Wldbg/de1Y4dJ7UPswmERbRNuDozkfCLejZJ4T0H
         QqT1z9althtFds1bIk7VZV7uM3/41AfG3z2QJPCtE4U8lebI677+/rQFYOHdO/UJ5OfD
         5RHiriGjEzwbFWf4FbOer0HpcoD658YRaiqWB/5tGB4K6GJVjJTOadMvUg8f3sUjohQA
         Spuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790036579; x=1790641379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jQN61CI3XpI1eI/D+U8aClQsfi0fYX2Xsqv28eim8Zc=;
        b=KtNcEtqycm0Va/NFZPwU7wbAc/DEpZP8h3h4AeQLWYk4rqVRTsEuk74K3Mb4uiV2AS
         Z5RGUd+98dix+C5Ndc7NhmckQEKF3zW6/tzlRH1mG7X+8i4UGsOdnVKvrghyjx/YV1gz
         vJ+T3056EkdcswEsV43DG8ZiANpTVtjpnhndFXSAVgtyNn/41UN/u5dkJJuxoOT/RgsC
         iFW6oQuJIYTMXvQqlJvZSUr0TCtEr5XdpRR9K41g+SdCJhQ2X5zDKwGRS7wnFaqgiK4O
         wkYH+H4gnsjhhzZFiygxIlhuXJffOLN02hT/UcWhpU4KuhvRLNxGGOf5Fdd6Zh+Z2si0
         C8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036579; x=1790641379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQN61CI3XpI1eI/D+U8aClQsfi0fYX2Xsqv28eim8Zc=;
        b=WqcSqZtKWzpav7xUJLFbtbZUoRpGMrQyLpyHa+XMobOhX92WRHroLhhYRky5aB9enw
         u+sZdefW16XsNHs1VrG2u4JW5jxW1BmL8oLc5tKA+Br7vs0e8q2DoW9Dr/dTDdICd4Vx
         08w9WWsCS2UdRjtGxb2/87yjoXvtvTVDaOy+NQgrDCqKEVNqVs7b+lgMQWeg9kgbftf7
         oKs5dR7XLH2lOE/C8nugmpSoiIzsX7UOHsTpEwRIpg+6/KBa8GU36v+kwzYTBl4X5MF8
         CGgtB9Rep7eHSHzsnfiwUDFL/mNr6H9/KwPM+rjZsPoiMHZwpL8nl4utZcDFvctOvWeD
         0Ojg==
X-Forwarded-Encrypted: i=1; AKwUvBzLM+FAz9i3DwdAqvnw9nikbPOiGMRphzzYJCZA13gCzSwmBhMlUQGHMszoS8pQSw2F7F2r6joArBBnU5Zt+24=@vger.kernel.org
X-Gm-Message-State: AFuF++lcq92eLUp2aE7b186As7aSp7uX8zWOu5AZMhoXFLzfgSvDDh7H
	YQloxbPsUNYS7Q0P6RvKUL7uzzabYYPLxVmfvMuB4GMmUDBoa2Egjf0qnIZNOImdKBSfnHbwaYH
	8m52Zy1uCV3l6X2bc0MojklaeZ7KT9YvOQhxgh95r
X-Gm-Gg: AYBFou3OJsnxfzUvKCv3fst5sOTzQuSxwj4dFNngO09p28/+p6wL6kzOuXKC/oHW/du
	XV0zInnxA9qbZcD+bHk6X+c6N0xHmA8AGwGfU9mtNLf3ofjcNh+CfH8GZZHwFJ5D5VktKzBJ8Rv
	6WdT5T6FCn9J9g+vPE5hqGJizv8EK49N1B5DZwQqJryu0bh3vPfijTCVw72nHnIy2JiX0qNUVcU
	J6L//+t1WgI8hS51JYu+1C3IuqVtvKo72qUn9S321B4YCVI1z5r9Knr3OIApB6slh6rP9p1f+Fx
	+HS9TJcBQ7HnNPecyBtm7IQMAqfZjzTXwIJv+lX2KK/j0aze6TT05Aj9uMZOqZuZIQE41/D9Vtr
	sHhdY7FREHFaghIWPrdwR6id6ILhh0S/9NKzVMvL7FYVfyCIBGt+ZErDB0jgn2GHRbYnKcJ+zZJ
	zENqtv
X-Received: by 2002:a05:622a:4d1:b0:52f:b9ad:9dad with SMTP id
 d75a77b69052e-532d8e379c4mr30898621cf.36.1790036578472; Mon, 21 Sep 2026
 17:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921222609.50824-4-jeffjo@openai.com> <20260921222609.50824-5-jeffjo@openai.com>
In-Reply-To: <20260921222609.50824-5-jeffjo@openai.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 02:22:47 +0200
X-Gm-Features: AcwNN1U8yZYsoXQmu5K6WdHeMLLadZtQsvSs1XAbGHZMJT-3PJKd4bwNzD67oNk
Message-ID: <CANn89iL6dWUza+iZeUwtB8b9V0=c6T3jPr9gOrJ37CJppiQB2w@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: refresh TS.Recent for accepted old ACKs
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:26=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> A TCP packet can carry new data while acknowledging traffic in the
> opposite direction. With overlapping traffic in both directions, a
> delayed packet's acknowledgment can be older than one Linux has already
> accepted, even when that packet fills a gap in the received data.
>
> Linux accepts the data, but tcp_ack() takes the old_ack path and skips
> updating TS.Recent, the timestamp saved for outgoing acknowledgments.
> The reply therefore echoes an older timestamp. If the sender uses this
> echo to measure round-trip time after a long idle period, its estimate
> includes the idle time and can reduce its sending rate.
>
> Update TS.Recent in old_ack using tcp_replace_ts_recent(), before SACK
> processing can trigger a transmission. This reuses the existing timestamp
> and sequence checks, including PAWS protection against old duplicate
> packets. Leave SYN_RECV unchanged because its caller rejects old ACKs;
> established and closing connections accept them.
>
> Echoing the timestamp of the packet that fills the receive gap follows
> RFC 7323 section 4.3. In a socket reproduction with 300 seconds idle,
> controlled reordering and retransmission to exercise timestamp-based RTT
> sampling, the sender's smoothed round-trip time was 37.5 seconds without
> the fix and 15.5 ms with it.
>
> Fixes: 12fb3dd9dc3c ("tcp: call tcp_replace_ts_recent() from tcp_ack()")
> Assisted-by: LLM sparse
> Signed-off-by: Jeff Jo <jeffjo@openai.com>
> ---
>  net/ipv4/tcp_input.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 92bc60716f33..f3f4c905ce00 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4465,6 +4465,13 @@ static int tcp_ack(struct sock *sk, const struct s=
k_buff *skb, int flag)
>         return 1;
>
>  old_ack:
> +       /* Closing connections also accept old ACKs. SYN_RECV rejects the=
m in
> +        * the caller, so leave its timestamp unchanged. Update before SA=
CK
> +        * processing can trigger a retransmission.
> +        */
> +       if (sk->sk_state !=3D TCP_SYN_RECV && (flag & FLAG_UPDATE_TS_RECE=
NT))
> +               flag |=3D tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq)=
;
> +

I think you missed 3d501dd326fb ("tcp: do not accept ACK of bytes we
never sent")

sk->sk_state can not be TCP_SYN_RECV at this point.

Therefore your patch could simply be:

if (flag & FLAG_UPDATE_TS_RECENT)
        tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq);

Thanks.

pw-bot: cr
