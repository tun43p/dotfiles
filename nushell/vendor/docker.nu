# docker.nu — Docker aliases and helpers

# List running containers
export def dps [] {
    ^docker ps --format "{{json .}}"
    | lines
    | each { from json }
    | select ID Names Status Ports
}

# List all containers
export def dpa [] {
    ^docker ps -a --format "{{json .}}"
    | lines
    | each { from json }
    | select ID Names Status Ports
}

# Follow container logs
export def dlogs [container: string, --tail(-t): int] {
    let t = if ($tail | is-not-empty) { [--tail $tail] } else { [] }
    docker logs -f ...$t $container
}

# Exec into container
export def dexec [container: string, --shell(-s): string = "sh"] {
    docker exec -it $container $shell
}

# Docker system prune
export def dprune [--volumes(-v)] {
    let v = if $volumes { [--volumes] } else { [] }
    docker system prune -af ...$v
}

# Docker images
export def dimg [] {
    ^docker images --format "{{json .}}"
    | lines
    | each { from json }
    | select Repository Tag Size CreatedSince
}

# Docker compose shortcuts
export alias dc = docker compose
export alias dcu = docker compose up -d
export alias dcd = docker compose down
export alias dcl = docker compose logs -f
export alias dcb = docker compose build
export alias dcr = docker compose restart
