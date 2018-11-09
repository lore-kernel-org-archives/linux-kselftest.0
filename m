From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Thu, 8 Nov 2018 19:37:05 -0800
Subject: [PATCH v4 bpf-next 2/7] libbpf: cleanup after partial failure
 in bpf_object__pin
In-Reply-To: <20181109002213.5914-3-s@fomichev.me>
References: <20181109002213.5914-1-s@fomichev.me>
 <20181109002213.5914-3-s@fomichev.me>
Message-ID: <20181108193705.2933c2bc@cakuba.netronome.com>

On Thu,  8 Nov 2018 16:22:08 -0800, Stanislav Fomichev wrote:
> +	for (map = bpf_map__prev(map, obj);
> +	     map != NULL;
> +	     map = bpf_map__prev(map, obj)) {

nit pick: if you need to respin all these for loops on error paths could
          have been more concise while loops
