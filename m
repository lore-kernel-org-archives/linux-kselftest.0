From: sdf@fomichev.me (Stanislav Fomichev)
Date: Fri, 9 Nov 2018 07:41:55 -0800
Subject: [PATCH v4 bpf-next 2/7] libbpf: cleanup after partial failure in
 bpf_object__pin
In-Reply-To: <20181108193705.2933c2bc@cakuba.netronome.com>
References: <20181109002213.5914-1-s@fomichev.me>
 <20181109002213.5914-3-s@fomichev.me>
 <20181108193705.2933c2bc@cakuba.netronome.com>
Message-ID: <20181109154155.m2zqdylynsk4w4qy@mini-arch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109154155.d3xUbWntGSBN3srvr_1jyiNXdCnc95x0vgcF1oPX6tw@z>

On 11/08, Jakub Kicinski wrote:
> On Thu,  8 Nov 2018 16:22:08 -0800, Stanislav Fomichev wrote:
> > +	for (map = bpf_map__prev(map, obj);
> > +	     map != NULL;
> > +	     map = bpf_map__prev(map, obj)) {
> 
> nit pick: if you need to respin all these for loops on error paths could
>           have been more concise while loops
Agreed with everything, will address this one and the other comments in v5.
Thank you for another thorough review!
