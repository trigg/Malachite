FROM fedora:44 as builder

# Bind mount build scripts, download dependencies, compile, and install to /usr
RUN --mount=type=bind,source=build_files/build.sh,target=/tmp/build.sh \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /tmp/build.sh


FROM ghcr.io/ublue-os/base-main:latest

COPY system_files/ /

COPY --from=builder /usr/bin/wayfire* /usr/bin/
COPY --from=builder /usr/bin/wf-* /usr/bin/
COPY --from=builder /usr/lib/libwf-config* /usr/lib/
COPY --from=builder /usr/lib64/wayfire/ /usr/lib64/wayfire/
COPY --from=builder /usr/lib/wayfire/ /usr/lib/wayfire/
COPY --from=builder /usr/share/wayfire/ /usr/share/wayfire/
COPY --from=builder /usr/share/wayland-sessions/ /usr/share/wayland-sessions/
COPY --from=builder /usr/share/wf-shell/ /usr/share/wf-shell/
COPY --from=builder /usr/share/wf-session/ /usr/share/wf-session/
COPY --from=builder /usr/share/themes/ /usr/share/themes/

RUN --mount=type=bind,source=build_files/os.sh,target=/tmp/os.sh \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /tmp/os.sh

RUN bootc container lint
